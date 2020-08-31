function varargout = DSS(varargin)
% DSS MATLAB code for DSS.fig
%      DSS, by itself, creates a new DSS or raises the existing
%      singleton*.
%
%      H = DSS returns the handle to a new DSS or the handle to
%      the existing singleton*.
%
%      DSS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DSS.M with the given input arguments.
%
%      DSS('Property','Value',...) creates a new DSS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DSS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DSS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DSS

% Last Modified by GUIDE v2.5 29-May-2016 12:44:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DSS_OpeningFcn, ...
                   'gui_OutputFcn',  @DSS_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DSS is made visible.
function DSS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DSS (see VARARGIN)

% Choose default command line output for DSS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DSS wait for user response (see UIRESUME)
% uiwait(handles.figure1);
handles.mfType='trimf';
handles.X=[]
handles.Y=[]
handles.TrainTest=[]
% % handles.Xtest=[]
% % handles.Ytest=[]
guidata(hObject, handles); % updates handles structure


% --- Outputs from this function are returned to the command line.
function varargout = DSS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in train_file_button.
function train_file_button_Callback(hObject, eventdata, handles)
% hObject    handle to train_file_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.txt','Select the training file');
% msgbox([PathName FileName]);
[x1,x2,x3,y]=textread([PathName FileName],'%f %f %f %f')
handles.X=[x1,x2,x3]
handles.Y = y
guidata(hObject, handles); % updates handles structure
%msgbox('Training file reading done!')

% % % --- Executes on button press in test_file_button.
% % function test_file_button_Callback(hObject, eventdata, handles)
% % % hObject    handle to test_file_button (see GCBO)
% % % eventdata  reserved - to be defined in a future version of MATLAB
% % % handles    structure with handles and user data (see GUIDATA)
% % [FileName,PathName] = uigetfile('*.txt','Select the testing file');
% % [x1test,x2test,x3test,ytest]=textread([PathName FileName],'%f %f %f %f')
% % handles.Xtest=[x1test,x2test,x3test]
% % handles.Ytest = ytest
% % guidata(hObject, handles); % updates handles structure
% % %msgbox('Testing file reading done!')

function NumMF_edit_Callback(hObject, eventdata, handles)
% hObject    handle to NumMF_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumMF_edit as text
%        str2double(get(hObject,'String')) returns contents of NumMF_edit as a double


% --- Executes during object creation, after setting all properties.
function NumMF_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumMF_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%-------------------------------------------------

% --- Executes on selection change in TypeMF_popup.
function TypeMF_popup_Callback(hObject, eventdata, handles)
% hObject    handle to TypeMF_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns TypeMF_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TypeMF_popup
contents = cellstr(get(hObject,'String'))
handles.mfType =contents{get(hObject,'Value')}
guidata(hObject, handles); % updates handles structure

% --- Executes during object creation, after setting all properties.
function TypeMF_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TypeMF_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%--------------------------------------------------

function NumEpoch_edit_Callback(hObject, eventdata, handles)
% hObject    handle to NumEpoch_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumEpoch_edit as text
%        str2double(get(hObject,'String')) returns contents of NumEpoch_edit as a double


% --- Executes during object creation, after setting all properties.
function NumEpoch_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumEpoch_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Train Button----------------------------------------


function Train_btn_Callback(hObject, eventdata, handles)
% hObject    handle to Train_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num_MF_str = get(handles.NumMF_edit,'string');
numMFs = str2num(num_MF_str);

num_Epoch_str = get(handles.NumEpoch_edit,'string');
numEpoch = str2num(num_Epoch_str);

ANFIS_Test_Per = get(handles.ANFISTestPercentage,'string');
ANFISTestPer = str2num(ANFIS_Test_Per);

ixx = randperm(length(handles.X));

V=1-ANFISTestPer/100; %Training data include the first to V-th number.  

CC=length(handles.X);

TrainTest = floor(V*CC);

ANFISinput_train = handles.X(ixx(1:TrainTest),:);
ANFISoutput_train = handles.Y(ixx(1:TrainTest),1);


trnData = [ANFISinput_train ANFISoutput_train];
in_fis = genfis1(trnData,numMFs,handles.mfType);
dispOpt = zeros(1,4);
out_fis = anfis(trnData,in_fis,numEpoch,dispOpt);
%msgbox('Training done!')
% % % ANFIS_Y=evalfis(handles.X,out_fis)
ANFIS_Y=evalfis(ANFISinput_train,out_fis)


ANFISRtrain = corr(ANFISoutput_train,ANFIS_Y);
ANFIS_model.corr=mean(ANFISRtrain,1);
ANFISCORR = num2str(ANFIS_model.corr);
set(handles.ANFISCORR,'String',ANFISCORR);


axes(handles.axesEst);
ANFIStrainplot=plot(ANFISoutput_train,'k');
set(ANFIStrainplot,'LineWidth',2);
hold on;
plot(ANFIS_Y,'--g');
%axis([1 315 -100 100]);
legend('Measured','ANFIS Est.')
hold on




% ANFIS Test button-----------------------------------------


function Test_btn_Callback(hObject, eventdata, handles)
% hObject    handle to Test_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num_MF_str = get(handles.NumMF_edit,'string');
numMFs = str2num(num_MF_str);

num_Epoch_str = get(handles.NumEpoch_edit,'string');
numEpoch = str2num(num_Epoch_str);

ixx = randperm(length(handles.X));

ANFIS_Test_Per = get(handles.ANFISTestPercentage,'string');
ANFISTestPer = str2num(ANFIS_Test_Per);

V=1-ANFISTestPer/100; %Training data include the first to V-th number.  

TrainTest = floor(V*length(handles.X));

W=TrainTest+1; %Test data include W-th number to end.

ANFISinput_train = handles.X(ixx(1:TrainTest),:);
ANFISoutput_train = handles.Y(ixx(1:TrainTest),1);

ANFISinput_test = handles.X(ixx(W:end),:);
ANFISoutput_test = handles.Y(ixx(W:end),1);

% % % % trnData = [ANFISinput_train ANFISoutput_train];
% % % % chkData = [ANFISinput_test ANFISoutput_test];
% % % % inn_fis = genfis1(trnData,numMFs,handles.mfType);
% % % % chkFis = genfis1(chkData,numMFs,handles.mfType);
% % % % optMethod=1;
% % % % dispOpt = zeros(1,4);
% % % % [fis,error,stepsize,chkFis,chkErr] = anfis(trnData,inn_fis,numEpoch,dispOpt,chkData,optMethod);
% % % % %msgbox('Testing done!')


trnData = [ANFISinput_test ANFISoutput_test];
in_fis = genfis1(trnData,numMFs,handles.mfType);
dispOpt = zeros(1,4);
out_fis = anfis(trnData,in_fis,numEpoch,dispOpt);
%msgbox('Training done!')
% % % ANFIS_Y=evalfis(handles.X,out_fis)
ANFIS_Y_test=evalfis(ANFISinput_test,out_fis)

ANFISErr=ANFIS_Y_test-ANFISoutput_test;


ANFISRtest = corr(ANFISoutput_test,ANFIS_Y_test);
ANFIS_model.corr=mean(ANFISRtest,1);
ANFISCORR2 = num2str(ANFIS_model.corr);
set(handles.ANFISCORR2,'String',ANFISCORR2);

% axes(handles.axesEst);
% plot(error);
% % %axis([1 10 0.002 0.003]);
% legend('Training Data Error')
% xlabel('Epoch')
% ylabel('RMSE')

axes(handles.axesError);
% % % plot(chkErr);
% % % hold on;
plot(ANFISErr,'--g');
hold on;
%axis([1 10 0.002 0.003]);
legend('ANFIS Error')
% xlabel('Epoch')
% ylabel('RMSE')



%ANFISCORR = num2str();


%File, Help-----------------------------------------------------------

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Open

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
new


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpdesk



%ANN----------------------------


% --- Executes on button press in ANNTrain_btn.
function ANNTrain_btn_Callback(hObject, eventdata, handles)
% hObject    handle to ANNTrain_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

num_Neuron_str = get(handles.NumNeuron_edit,'string');
numNeurons = str2num(num_Neuron_str);

num_MF_str = get(handles.ANNTestPercentage,'string');
TestPer = str2num(num_MF_str);

ANNnum_Epoch_str = get(handles.ANNNumEpoch_edit,'string');
ANNnumEpoch = str2num(ANNnum_Epoch_str);


Momentum_str = get(handles.Momentum_edit,'string');
Momentum = str2num(Momentum_str);

ix = randperm(length(handles.X));

ANNThreshold=1-TestPer/100; %Training data include the first to V-th number.  

ANNTrainTest = floor(ANNThreshold*length(handles.X));

ANNinput_train = handles.X(ix(1:ANNTrainTest),:);
ANNoutput_train = handles.Y(ix(1:ANNTrainTest),1)

n = length(ANNoutput_train);

ANNTrainTest=1+ANNTrainTest;   %The numbers after threshold are in the ANN_test

ANNinput_test = handles.X(ix(ANNTrainTest:end),:);
ANNoutput_test = handles.Y(ix(ANNTrainTest:end),1);

%c = zeros(n,2); % correlation array

net = newff(ANNinput_train',ANNoutput_train',numNeurons);
% net = feedforwardnet(10);
net.trainParam.epochs= ANNnumEpoch;
net.divideParam.trainRatio =1-TestPer/100;
net.divideParam.valRatio= TestPer/100;
net.divideParam.testRatio=0;
net.trainParam.momentum=Momentum;
net.trainParam.showWindow = false;
net = train(net,ANNinput_train',ANNoutput_train');
    
y_pred_train = sim(net,ANNinput_train');
y_pred_test = sim(net,ANNinput_test');

axes(handles.axesEst);
%plot(output_train(:,1))
%hold on
plot(y_pred_train,'-.r')
legend('Measured','ANFIS Est.','ANN Est.') 


Rtrain = corr(ANNoutput_train,y_pred_train');
nn_model.corr=mean(Rtrain,1);
ANNCORR = num2str(nn_model.corr);
set(handles.ANNCORR,'String',ANNCORR);

% n = length(output_train);
% c = zeros(n,2);
% c= [corr(output_train,y_pred_train') corr(output_test,y_pred_test')]
% nn_model.corr=mean(c,1);
% ANNCORR = num2str(nn_model.corr);


function NumNeuron_edit_Callback(hObject, eventdata, handles)
% hObject    handle to NumNeuron_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumNeuron_edit as text
%        str2double(get(hObject,'String')) returns contents of NumNeuron_edit as a double


% --- Executes during object creation, after setting all properties.
function NumNeuron_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumNeuron_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% ANN Test Button----------------------------------------------------------


function ANNTest_btn_Callback(hObject, eventdata, handles)
% hObject    handle to ANNTest_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


num_Neuron_str = get(handles.NumNeuron_edit,'string');
numNeurons = str2num(num_Neuron_str);

num_MF_str = get(handles.ANNTestPercentage,'string');
TestPer = str2num(num_MF_str);

ANNnum_Epoch_str = get(handles.ANNNumEpoch_edit,'string');
ANNnumEpoch = str2num(ANNnum_Epoch_str);


Momentum_str = get(handles.Momentum_edit,'string');
Momentum = str2num(Momentum_str);

ix = randperm(length(handles.X));

ANNThreshold=1-TestPer/100; %Training data include the first to V-th number.  

ANNTrainTest = floor(ANNThreshold*length(handles.X));

ANNinput_train = handles.X(ix(1:ANNTrainTest),:);
ANNoutput_train = handles.Y(ix(1:ANNTrainTest),1)

n = length(ANNoutput_train);

ANNTrainTest=1+ANNTrainTest;   %The numbers after threshold are in the ANN_test

ANNinput_test = handles.X(ix(ANNTrainTest:end),:);
ANNoutput_test = handles.Y(ix(ANNTrainTest:end),1);

%c = zeros(n,2); % correlation array

net = newff(ANNinput_train',ANNoutput_train',numNeurons);
% net = feedforwardnet(10);
net.trainParam.epochs= ANNnumEpoch;
net.divideParam.trainRatio =1-TestPer/100;
net.divideParam.valRatio= TestPer/100;
net.divideParam.testRatio=0;
net.trainParam.momentum=Momentum;
net.trainParam.showWindow = false;
net = train(net,ANNinput_train',ANNoutput_train');
    
y_pred_train = sim(net,ANNinput_train');
y_pred_test = sim(net,ANNinput_test');


ANNRtest = corr(ANNoutput_test,y_pred_test');
ANN_model.corr=mean(ANNRtest,1);
ANNCORR2 = num2str(ANN_model.corr);
set(handles.ANNCORR2,'String',ANNCORR2);


axes(handles.axesError);
plot(y_pred_test'-ANNoutput_test,'-.r')
legend('ANFIS Error','ANN Error')




function ANNTestPercentage_Callback(hObject, eventdata, handles)
% hObject    handle to ANNTestPercentage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ANNTestPercentage as text
%        str2double(get(hObject,'String')) returns contents of ANNTestPercentage as a double


% --- Executes during object creation, after setting all properties.
function ANNTestPercentage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ANNTestPercentage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ANNNumEpoch_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ANNNumEpoch_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ANNNumEpoch_edit as text
%        str2double(get(hObject,'String')) returns contents of ANNNumEpoch_edit as a double


% --- Executes during object creation, after setting all properties.
function ANNNumEpoch_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ANNNumEpoch_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Momentum_edit_Callback(hObject, eventdata, handles)
% hObject    handle to Momentum_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Momentum_edit as text
%        str2double(get(hObject,'String')) returns contents of Momentum_edit as a double


% --- Executes during object creation, after setting all properties.
function Momentum_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Momentum_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ANFISTestPercentage_Callback(hObject, eventdata, handles)
% hObject    handle to ANFISTestPercentage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ANFISTestPercentage as text
%        str2double(get(hObject,'String')) returns contents of ANFISTestPercentage as a double


% --- Executes during object creation, after setting all properties.
function ANFISTestPercentage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ANFISTestPercentage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Clear_btn.
function Clear_btn_Callback(hObject, eventdata, handles)
% hObject    handle to Clear_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% % % % --- Executes on button press in train_file_button.
% % % function pushbutton8_Callback(hObject, eventdata, handles)
% % % % hObject    handle to train_file_button (see GCBO)
% % % % eventdata  reserved - to be defined in a future version of MATLAB
% % % % handles    structure with handles and user data (see GUIDATA)
