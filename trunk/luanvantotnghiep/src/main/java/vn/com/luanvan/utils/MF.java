package vn.com.luanvan.utils;

import java.io.BufferedReader;
import java.io.FileReader;
import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vn.com.luanvan.service.DiemService;

@Component
public class MF{
	
	@Autowired
	private DiemService diemService;
	
    public final int COL_STUDENT = 0;
    public final int COL_TASK = 1;
    
    public final int TRAIN_SPLIT_VALUE = 0;
    public final int NEW_STUDENT_TASK = 1;
    
    public int[][] predictors;
    public int[] split; // (train=0) and (test=1)
    public float[] target;
    public int[] diem;
    
    String fnPredictor;
    String fnTarget;
    String fnSplit;
    String fnDiem;
    
    public float[] predictedPerformance;
    public float[] truePerformance;
    
    public float[][] fStudent; // student latent factors
    public float[][] fTask; // task latent factors
    
    public int[] newStudentID; // used for cold-start problem
    public int[] newTaskID; // used for cold-start problem
    
    public float globalAverage;

    public float minTarget = Float.MAX_VALUE, maxTarget = Float.MIN_VALUE;    

    public float learnRate = 0.005f;
    public float regularization = 0.015f;
    public int num_factors = 64;
    public int num_iterations = 80;

    
    //////////////////////////
    
    public void mainMF() throws Exception{
       	String currentDir = Utils.getConfigParam("luanvan.data.root.location");
    	fnPredictor = currentDir + "/assistment_predictors_kc.txt"; // studentID as user, SkillID as item, correct as rating
    	fnTarget = currentDir + "/assistment_target.txt";
    	fnSplit = currentDir + "/assistment_split.txt";
    	fnDiem = currentDir + "/assistment_diemid.txt";
    	
    	//use the following line for running on the console
    	//parse_command_line(args);
    	
    	readData(fnPredictor, fnTarget, fnSplit, fnDiem);    	
    	initialize();
    	train();
    	test();
    }
    
    //////////////////////////
    
    public void readData(String fnPred, String fnTarget, String fnSplit, String fnDiem) throws Exception{
    	
    	// read predictors
    	System.out.print("reading predictors...");    	
    	BufferedReader brPred = new BufferedReader(new FileReader(fnPred));     	
    	String line = brPred.readLine(); // header row has only 2 values: "#rows \t #columns"
    	int numPredRows = Integer.parseInt(line.split("\t")[0]);
    	int numPredCols = Integer.parseInt(line.split("\t")[1]);    	
    	predictors = new int[numPredRows][numPredCols];
    	int row = 0;    	
    	while ((line = brPred.readLine())!=null){
    		String[] studentID_taskID = line.split("\t");
    		int studentID = Integer.parseInt(studentID_taskID[COL_STUDENT]);
    		int taskID = Integer.parseInt(studentID_taskID[COL_TASK]);
    		predictors[row][COL_STUDENT] = studentID;
    		predictors[row][COL_TASK] = taskID;
    		row++;
    	}
    	brPred.close();
    	System.out.print("done.\t");
    	System.out.println("#predRows \t= " + numPredRows + " = " + row);
    
    	// read labels
    	System.out.print("reading target...");
    	BufferedReader brTarget = new BufferedReader(new FileReader(fnTarget));
    	line = brTarget.readLine(); // header row has only 1 value: #rows
    	int numTargetRows = Integer.parseInt(line);    	
    	target = new float[numTargetRows];
    	row = 0;    	
    	while ((line = brTarget.readLine())!=null){
    		float targetValue = Float.parseFloat(line);
    		target[row] = targetValue;    		
    		row++;
    	}
    	brTarget.close();
    	System.out.print("done.\t\t");
    	System.out.println("#targetRows \t= " + numTargetRows + " = " + row);
    	    	
    	// read split
    	System.out.print("reading split...");
    	BufferedReader brSplit = new BufferedReader(new FileReader(fnSplit));     	
    	line = brSplit.readLine(); // header row has only 1 value: #rows
    	int numSplitRows = Integer.parseInt(line);    	
    	split = new int[numSplitRows];
    	row = 0;
    	while ((line = brSplit.readLine())!=null){
    		int splitValue = Integer.parseInt(line);
    		split[row] = splitValue;
    		row++;
    	}
    	brSplit.close();
    	System.out.print("done.\t\t");
    	System.out.println("#splitRows \t= " + numSplitRows + " = " + row);    	    	
    	
    	//read diemId
    	
    	System.out.print("reading Diem...");
    	
    	BufferedReader brDiem= new BufferedReader(new FileReader(fnDiem));     	
    	line = brDiem.readLine(); // header row has only 1 value: #rows
    	int numDiemRows = Integer.parseInt(line);    	
    	diem = new int[numDiemRows];
    	row = 0;
    	while ((line = brDiem.readLine())!=null){
    		int diemValue = Integer.parseInt(line);
    		diem[row] = diemValue;
    		row++;
    	}
    	brDiem.close();
    	System.out.print("done.\t\t");
    	System.out.println("#diemRows \t= " + numDiemRows + " = " + row);    	   
    }
    
    /////////////////////////////////////////
    
    public void initialize() {
    	
    	// first initializing all students are new, then updating them during training (this is used to check the cold-start problem)
    	int maxStudentID = 0;
    	for (int i=0; i<predictors.length; i++){
    		if (maxStudentID < predictors[i][COL_STUDENT])
    			maxStudentID = predictors[i][COL_STUDENT];
    	}
    	newStudentID = new int[maxStudentID+1]; // note: all IDs start from 1
    	for (int sID=0; sID < newStudentID.length; sID++) 
    		newStudentID[sID] = NEW_STUDENT_TASK; // 1 is new; 0 is not new
    	
    	// first initializing all tasks are new, then updating them during training (this is used to check the cold-start problem)
    	int maxTaskID = 0;
    	for (int i=0; i<predictors.length; i++){
    		if (maxTaskID < predictors[i][COL_TASK])
    			maxTaskID = predictors[i][COL_TASK];
    	}
    	newTaskID = new int[maxTaskID+1]; //note: all IDs start from 1  	    	
    	for (int tID=0; tID < newTaskID.length; tID++) 
    		newTaskID[tID] = NEW_STUDENT_TASK; 
    	
    	System.out.println("maxStudentID = " + maxStudentID + "\t\tmaxTaskID = " + maxTaskID);
    	
    	// Initialize the latent factors: Draw randomly from -0.01 to 0.01
    	
    	fStudent = new float[maxStudentID+1][num_factors];
    	System.out.println("fStudent.length: " + fStudent.length);
    	for (int sID=0; sID < fStudent.length; sID++)
    		for (int k=0; k < num_factors; k++)
    			fStudent[sID][k] = (float) ((Math.random()*0.02)-0.01);
    	
    	fTask = new float[maxTaskID+1][num_factors];
    	for (int tID=0; tID < fTask.length; tID++)
    		for (int k=0; k < num_factors; k++)
    			fTask[tID][k] = (float) ((Math.random()*0.02)-0.01);
    	
    	//compute global average
    	int numTrainRows = 0;
    	for (int row = 0; row < predictors.length; row++){
    		if (split[row] == TRAIN_SPLIT_VALUE){
    			float targetValue = target[row];
    			if (targetValue < minTarget) minTarget = targetValue;
    			if (targetValue > maxTarget) maxTarget = targetValue; 
    			globalAverage += targetValue;
    			numTrainRows++;
    		}
		}
    	globalAverage = globalAverage/numTrainRows;
    	int numTestRows = predictors.length - numTrainRows;
    	System.out.println("minPerformance = " + minTarget + "\t\tmaxPerformance = " + maxTarget);
    	System.out.println("#numTrainRows = " + numTrainRows + "\t\tnumTestRows = " + numTestRows);
    	
    	// store the true performances for final evaluation
    	truePerformance = new float[numTestRows];
    	int testRow = 0;
    	for (int row=0; row<target.length; row++){
    		if (split[row]!=TRAIN_SPLIT_VALUE){
    			truePerformance[testRow++] = target[row];    			
    		}
    	}
    	
    }
    
    /////////////////////////////////////////
    
    public void train(){
    	long startTime = System.currentTimeMillis(); 
    	System.out.println("\ntraining...");    	
    	int numRows = predictors.length;
    	int iterations = num_iterations*numRows;
    	double errEpoche = 0; int numEpoche = 0;
    	
    	for (int iter = 0; iter < iterations; iter++) {    		
    		// a. draw a (training) row at random:
    		int row = (int) Math.floor(Math.random() * numRows);
    		while (split[row] != TRAIN_SPLIT_VALUE)
    			row = (int) Math.floor(Math.random() * numRows);
    		int student = predictors[row][COL_STUDENT];
    		int task = predictors[row][COL_TASK];
    		float performance = target[row]; // e.g. the "correct at first attempt"
    		
    		// b. compute the predictions:
    		float performancePred = 0;
    		for (int k = 0; k < num_factors; k++)
    			performancePred += fStudent[student][k] * fTask[task][k];
    		
    		// c. compute the error and update the gradients:
    		float err = performance - performancePred;
    		for (int k = 0; k < num_factors; k++) {
    			float update_student = learnRate * (err * fTask[task][k] - regularization * fStudent[student][k]);
    			float update_task = learnRate * (err * fStudent[student][k] - regularization * fTask[task][k]);
    			fStudent[student][k] += update_student;
    			fTask[task][k] += update_task;
    		}
    		
    		// d. update the epoch reporting:
    		numEpoche++;
    		errEpoche += err*err;
    		if ((iter+1) % (numRows/10) == 0) {
    			System.out.println("  RMSE iter " + Math.round((iter * 1.0 / numRows)*10)/10.0f + ": " + Math.sqrt(errEpoche / numEpoche));
    			errEpoche = 0;
    			numEpoche = 0;
    		}
    		
    		// e. update this student and this task to "not new"
    		newStudentID[student] = NEW_STUDENT_TASK - 1;
    		newTaskID[task] = NEW_STUDENT_TASK - 1;    
    	}

    	double trainTime = (System.currentTimeMillis() - startTime)*1.0 / 1000;
    	System.out.println("training time (sec.): "+trainTime);
    }
    
    //////////////////////////////////////
    
    public void test(){
    	int numRows = predictors.length;
    	int predRow = 0;
    	predictedPerformance = new float[truePerformance.length];
    	
    	for (int row = 0; row < numRows; row++) {
    		if (split[row] != TRAIN_SPLIT_VALUE) { //this is a test example
    			int student = predictors[row][COL_STUDENT];
        		int task = predictors[row][COL_TASK];
    			int diemId = diem[row];
    			
    			// compute the predictions:
        		float performancePred = 0;
        		
    			if (newStudentID[student] == NEW_STUDENT_TASK || newTaskID[task] == NEW_STUDENT_TASK){ // cold-start problem
    				performancePred = globalAverage;
    			}
    			else{
    				for (int k = 0; k < num_factors; k++){
            			performancePred += fStudent[student][k] * fTask[task][k];
            		}
    				
    				//bound the prediction in [minTarget, maxTarget]
    				if (performancePred < minTarget) performancePred = minTarget;
    				else if (performancePred > maxTarget) performancePred = maxTarget;
    			}
    			System.out.println("globalAverage: " + globalAverage);
    			
    			//set the prediction value
    			float temp = performancePred / truePerformance.length;
    			predictedPerformance[predRow++] = performancePred;
    			
    			System.out.println("student: " + student + "; hp: " + task + "; performancePred: " + performancePred + "; diemId: " + diemId + "; temp: " + temp);
    			// Update diem sinh vien vao database
    			DecimalFormat df = new DecimalFormat("#.#");
    			String diemDuDoan = df.format(Double.parseDouble(String.valueOf(performancePred)));
    			diemService.updateDiemByDiemIdAndHocPhanIdAndSinhVienId(Long.parseLong(String.valueOf(diemId)), diemDuDoan);
    	    }
    	}
    	    	
    	RMSE();
    	MAE();
    }
    
    /////////////////////////////////////////////
    
    public void RMSE() {
    	float ss = 0;    
    	for (int i = 0; i < truePerformance.length; i++){
    		float dif = predictedPerformance[i] - truePerformance[i];
    		ss += dif*dif;
    	}        	
    	float RMSEscore = (float) Math.sqrt(ss / truePerformance.length);
    	System.out.println("\nfinal RMSE = " + RMSEscore);
    }

    /////////////////////////////////////////////
    
    public void MAE() {
    	float sum = 0;    
    	for (int i = 0; i < truePerformance.length; i++){
    		sum += Math.abs(predictedPerformance[i] - truePerformance[i]);    		
    	}
    	float MAEscore = sum / truePerformance.length;
    	System.out.println("final MAE  = " + MAEscore);
    }

    /////////////////////////////////////////////
    
    public void parse_command_line(String[] args){
    	int argi = 0;    	
    	while (argi < args.length && args[argi].startsWith("-")) {
    		if (args[argi].equals("-f") && argi+1 < args.length) {
    			num_factors = Integer.parseInt(args[argi+1]);
    			argi++;
    		} else if (args[argi].equals("-r") && argi+1 < args.length) {
    			regularization = Float.parseFloat(args[argi+1]);
    			argi++;
		    } else if (args[argi].equals("-l") && argi+1 < args.length) {
		    	learnRate = Float.parseFloat(args[argi+1]);
		    	argi++;
		    } else if (args[argi].equals("-i") && argi+1 < args.length) {
		    	num_iterations = Integer.parseInt(args[argi+1]);
		    	argi++;
		    }
		    argi++;
    	}

		if (argi + 3 != args.length) {
		    System.out.println("usage: MF [options] <predtictorFile> <targetFile> <splitFile>");
		    System.out.println("  learn a matrix factorization using stochastic gradient descent");
		    System.out.println("where");
		    System.out.println("  <predtictorFile>  predictor matrix (seperated by tab)");
		    System.out.println("  <targetFile>      target vector");
		    System.out.println("  <splitFile>       split vector (0=train, 1=test)");	    
		    System.out.println("and with the options:");
		    System.out.println("  -f #  number of factors per mode (default: " + num_factors + ")");
		    System.out.println("  -r #  regularization term (default: " + regularization + ")");
		    System.out.println("  -l #  learning rate (default: " + learnRate + ")");
		    System.out.println("  -i #  number of iterations (default: " + num_iterations + ")");
		    System.exit(-1);
		}
		
    	fnPredictor = args[argi]; //"MFforPSP//data//assistment_predictors_kc.txt";
    	fnTarget = args[argi+1]; //"MFforPSP//data//assistment_target.txt";
    	fnSplit = args[argi+2]; //"MFforPSP//data//assistment_split.txt";    	    	
    }    
    
    /////////////////////////////////////////////
}
