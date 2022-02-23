function varargout = tuxiangbianhuan(varargin)
% TUXIANGBIANHUAN MATLAB code for tuxiangbianhuan.fig
%      TUXIANGBIANHUAN, by itself, creates a new TUXIANGBIANHUAN or raises the existing
%      singleton*.
%
%      H = TUXIANGBIANHUAN returns the handle to a new TUXIANGBIANHUAN or the handle to
%      the existing singleton*.
%
%      TUXIANGBIANHUAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUXIANGBIANHUAN.M with the given input arguments.
%
%      TUXIANGBIANHUAN('Property','Value',...) creates a new TUXIANGBIANHUAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tuxiangbianhuan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tuxiangbianhuan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tuxiangbianhuan

% Last Modified by GUIDE v2.5 22-Feb-2022 13:49:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tuxiangbianhuan_OpeningFcn, ...
                   'gui_OutputFcn',  @tuxiangbianhuan_OutputFcn, ...
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


% --- Executes just before tuxiangbianhuan is made visible.
function tuxiangbianhuan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tuxiangbianhuan (see VARARGIN)

% Choose default command line output for tuxiangbianhuan
handles.output = hObject;
%set(handles.axes2,'Enable','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tuxiangbianhuan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tuxiangbianhuan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile(...
    {'*.bmp;*.jpg; *.png; *.jpeg; ','Image Files(*.bmp,*.jpg,*.png,*.jpeg)';...
    '*.*',      'All Files(*.*)' }...
    , 'Pick an image');%打开文件 选择图像
if isequal(filename,0) || isequal(pathname,0)
    return;%如 果点了“ 取 消”
end
axes(handles.axes1);%重要，在哪个坐标轴显示图像
fpath = [pathname filename];%路径名和文件名
img1 = imread(fpath);%读取图像 
imshow(img1);%显示图像
setappdata(handles.figure1,'img1',img1);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img2=getappdata(handles.figure1,'img1');
img3=imresize(img2,0.5);
%figposition=get(gcf,'position');
%figwidth=figposition(1);
%figheight=figposition(2);
%set(handles.axes2,'position',[figposition(1),figposition(2),figposition(3),figposition(4)]);
axes(handles.axes2);
imshow(img3);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img7=getappdata(handles.figure1,'img1');
img7=flipud(img7);%垂直镜像
axes(handles.axes2);
imshow(img7);
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img5=getappdata(handles.figure1,'img1');
img5=fliplr(img5);
axes(handles.axes2);
imshow(img5);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes2,'reset');

%set(handles.axes2,'Enable','on');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

current_Obj=get(eventdata.NewValue,'Tag');
switch current_Obj
    case 'pingyi'
        img6=getappdata(handles.figure1,'img1');
        img6=imrotate(img6,45);
        axes(handles.axes2);
        imshow(img6);
    case'radiobutton2'
        img6=getappdata(handles.figure1,'img1');
        img6=imrotate(img6,90);
        axes(handles.axes2);
        imshow(img6);
    case'radiobutton3'
        img6=getappdata(handles.figure1,'img1');
        img6=imrotate(img6,150);
        axes(handles.axes2);
        imshow(img6);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
var=get(handles.slider3,'value');%获得slider3的值
set(handles.edit1,'string',num2str(var))%num2str将数值转化为 字符
img7=getappdata(handles.figure1,'img1');
        img7=imrotate(img7,var);
        axes(handles.axes2);
        imshow(img7);
% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f,p]=uiputfile({'*.bmp;*.jpg; *.png; *.jpeg; ','Image Files(*.bmp,*.jpg,*.png,*.jpeg)';...
    '*.*',      'All Files(*.*)' },'保存文件');
str =strcat(p,f);
pix=getframe(handles.axes2);%getframe捕获轴上的图像
imwrite(pix.cdata,str,'jpg')%yff原创
