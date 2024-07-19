data = readmatrix("C:\Users\Home\Downloads\16066390265270019.xls");
X = data(:,1:4);
Y = data(:,5);
%% 
%histogram(Y,10)
%% 
%Y_normalized = log(1+y);
%histogram(Y_normalized , 10)
%%
xt = X';
yt = Y';
hiddenLayerSize = 10;
%% 
net = fitnet(hiddenLayerSize);
net.divideparam.trainRatio = 60/100;
net.divideparam.valRatio = 20/100;
net.divideparam.testRatio = 20/100;
[net,tr] = train(net , xt , yt);
%% 
net.numInputs = 4;
net.numOutputs = 1;
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'puelin';
%%%
%% 
net.trainParam.lr=0.9;
net.trainParam.epochs=13500;
%% 
yTrain = exp(net(xt(:,tr.trainInd))) -1;
yTrainTrue = exp(yt(tr.trainInd))-1;
sqrt(mean((yTrain-yTrainTrue).^2));
yVal = exp(net(xt(:,tr.valInd)))-1;
yValTrue = exp(yt(tr.valInd))-1;
sqrt(mean(yVal-yValTrue).^2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%بعد از اجرای کد و ترین شدن شبکه عصبی میتوان نمودار های رگرسیون برای همه
%مقادیر را مشاهده کرد.ضمنا مقدار تکرار  و نرخ یادگیری را دستی تنظیم کردم