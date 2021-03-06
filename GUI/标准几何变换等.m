function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 24-Jan-2022 22:26:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
x=handles.x
B=x;%%???????????????
se=strel('disk',25);%%???????????????25?????????
Q=imopen(B,se);%%????????????%%%
K=imsubtract(B,Q);
BW2=edge(K,'roberts',0.005);  
 %%%%????????????%%%%%%%%%%%%%%%
axes(handles.axes2);
imshow(BW2);
title('robert????????????');

% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
x=handles.x
B=x;%%???????????????
se=strel('disk',25);%%???????????????25?????????
Q=imopen(B,se);%%????????????%%%
K=imsubtract(B,Q);
BW3=edge(K,'prewitt');

%%%%????????????%%%%%%%%%%%%%%%
axes(handles.axes2);
imshow(BW3);
title('prewitt????????????');
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)
x=handles.x
B=x;%%???????????????
se=strel('disk',25);%%???????????????25?????????
Q=imopen(B,se);%%????????????%%%
 K=imsubtract(B,Q);
 BW1=edge(K,'sobel');%%
 
 %%%%????????????%%%%%%%%%%%%%%%
axes(handles.axes2);
imshow(BW1);
title('sobel????????????');
% hObject    handle to Untitled_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
x=handles.x
y=histeq(x)
axes(handles.axes2)
imshow(y)
title('??????????????????')


% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
x=handles.x
f=x;
[row,col]=size(f);
f1=double(f);
prompt={'???????????????(0~255):' '???????????????(0~255):'};
name='???????????????';
numlines=1;
defaultanswer={'0' '255'};
anss=inputdlg(prompt,name,numlines,defaultanswer);
b=str2num(anss{1});
a=str2num(anss{2});

fminGray=min(min(f1));
fmaxGray=max(max(f1));
g=double(zeros([row,col]));
for x=1:row
    for y=1:col   
         g(x,y)=[(a-b)*(f1(x,y)-fminGray)/(fmaxGray-fminGray)]+b;
    end
end
if (row<=256)&(row<=256)
    W=256;
else
    W=max(row,col);
end
extendx=double(zeros([W,W]));
for m=1:W
     for n=1:W
          if (m<=row)&(n<=col)
          extendx(m,n)=g(m,n);
          else
              extendx(m,n)=realmax;
          end
     end
end
axes(handles.axes2);
imshow(extendx,[0,255]);
title('?????????????????????')
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
 [filename, pathname] = uigetfile({'*.bmp';'*.jpg';'*.jpeg'},'????????????');
    if isequal(filename,0) | isequal(pathname,0)
       disp('??????');
    else
       disp(['?????? ', fullfile(pathname, filename)])
    end
x=imread(filename);
axes(handles.axes1)
imshow(x);
title('??????');
handles.x=x;
guidata(hObject, handles);
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
clc
close all
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
x=handles.x
y=imrotate(x,50)
axes(handles.axes2)
imshow(y)
title('??????50???')
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
x=handles.x
[row,col]=size(x);
for i=1:row
    for j=1:col
        y(i,j)=x(i,col-j+1);
    end
end
if (row<=256)&(row<=256)
    W=256;
else
    W=max(row,col);
end
extendx=double(zeros([W,W]));
for m=1:W
     for n=1:W
          if (m<=row)&(n<=col)
          extendx(m,n)=y(m,n);
          else
              extendx(m,n)=realmax;
          end
     end
end
axes(handles.axes2);
imshow(extendx,[min(min(y)),max(max(y))]);
title('????????????')
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
x=handles.x;
[a b c]=size(x);
if c==3
    x1=rgb2gray(x);
    axes(handles.axes2);
    imshow(x1);
    title('????????????');
else
    msgbox('???????????????????????????????????????');
end

% hObject    handle to Untitled_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_19_Callback(hObject, eventdata, handles)
x=handles.x;
x1=~x;
axes(handles.axes2);
imshow(x1);
title('??????');

% hObject    handle to Untitled_19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
x=handles.x;
x1=im2bw(x);
axes(handles.axes2);
imshow(x1);
title('???????????????');

% hObject    handle to Untitled_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
x=handles.x;
figure
x1=imresize(x,2);
imshow(x1);
title('??????2???');
axes(handles.axes2);
imshow(x1);
title('??????2???');
% hObject    handle to Untitled_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
