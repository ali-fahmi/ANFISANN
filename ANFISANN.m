function nn_model = NN (input_train,output_train,n_neuron)

data = csvread('AllData.csv');
input = data(:,[1:3]);
output = data(:,[6]); %SA

%ANFIS--------------------------------------------------------------------

% % input_train = input(ix(1:221),:);
% % output_train = output(ix(1:221),1);

% % trnData=[input_train output_train];
trnData=[input output];

numMFs=3;
mfType = 'trapmf';
in_fis = genfis1(trnData,numMFs,mfType);
epoch_n = 2000;
dispOpt = zeros(1,4);
out_fis = anfis(trnData,in_fis,epoch_n,dispOpt);                    

ANFISCorr=corr(output,evalfis(input,out_fis))

%%Data=plot(output_train(:,1),'k')
Data=plot(output(:,1),'k')
set(Data,'LineWidth',1);
hold on
%%plot(evalfis(input_train,out_fis),'--g');
plot(evalfis(input,out_fis),'--g');
legend('Actual Data','ANFIS Prediction')
ylabel('SA')
hold on

%ANN----------------------------------------------------------------------

% % n = length(output_train);
% % 
% % ix = randperm(length(input));
% % 
% % input_test = input(ix(222:end),:);
% % output_test = output(ix(222:end),1);

n_neuron=10;

%%net = newff(input_train',output_train',n_neuron);
net = newff(input',output',n_neuron);
   % net = feedforwardnet(10);
net.trainParam.epochs = 2000;
net.divideParam.trainRatio =0.7;
net.divideParam.valRatio=0.15;
net.divideParam.testRatio=0.15;
net.layers{1}.transferFcn = 'logsig'; % Hidden Layer Activation Function
net.layers{2}.transferFcn = 'tansig';
net.trainParam.lr=0.5;
net.trainParam.showWindow = false;
net = train(net,input',output');
    
y_pred = sim(net,input');
%%y_pred_test = sim(net,input_test');
    
%%c= [corr(output_train,y_pred_train') corr(output_test,y_pred_test')]

%%ANNoutput=[y_pred_train y_pred_test]'

ANNCorr=corr(output,y_pred')

% nn_model.corr=mean(c,1);

plot(y_pred,'-.r')
legend('Actual Data','ANFIS Prediction','ANN Prediction')
% print('-dpng', '-r300');
