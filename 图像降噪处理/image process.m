function varargout = tt(varargin)
%TT MATLAB code file for tt.fig
%      TT, by itself, creates a new TT or raises the existing
%      singleton*.
%
%      H = TT returns the handle to a new TT or the handle to
%      the existing singleton*.
%
%      TT('Property','Value',...) creates a new TT using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to tt_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      TT('CALLBACK') and TT('CALLBACK',hObject,...) call the
%      local function named CALLBACK in TT.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tt

% Last Modified by GUIDE v2.5 22-Feb-2022 22:40:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tt_OpeningFcn, ...
                   'gui_OutputFcn',  @tt_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before tt is made visible.
function tt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for tt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tt_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in oprn.
function oprn_Callback(hObject, eventdata, handles)
% hObject    handle to oprn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile(...
    {'*.bmp;*.jpg; *.png; *.jpeg; ','Image Files(*.bmp,*.jpg,*.png,*.jpeg)';...
    '*.*',      'All Files(*.*)' }...
    , 'Pick an image');%???????????? ????????????
if isequal(filename,0) || isequal(pathname,0)
    return;%??? ???????????? ??? ??????
end
axes(handles.axes7);%???????????????????????????????????????
fpath = [pathname filename];%?????????????????????
img1 = imread(fpath);%???????????? 
imshow(img1);%????????????
title('????????????');%????????????
setappdata(handles.figure1,'img1',img1);%setappdata????????????????????????????????????getappdata


% --- Executes on button press in nosie.
function nosie_Callback(hObject, eventdata, handles)
% hObject    handle to nosie (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img2=getappdata(handles.figure1,'img1');%?????????????????????
img2=rgb2gray(img2)%?????????
img2 = imnoise(img2,'gaussian',0.09); %???????????????
axes(handles.axes8);%???????????????
imshow(img2);
setappdata(handles.figure1,'img2',img2);
% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all 


% --- Executes on button press in jsalt.
function jsalt_Callback(hObject, eventdata, handles)
% hObject    handle to jsalt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img3=getappdata(handles.figure1,'img1');
img3=rgb2gray(img3)
img4= imnoise(img3,'salt & pepper',0.03); %????????????0????????????0.03???????????????
axes(handles.axes9);
imshow(img4);
setappdata(handles.figure1,'img4',img4);


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes10,'reset');%???????????????????????????10

% --- Executes on button press in medfi.
function medfi_Callback(hObject, eventdata, handles)
% hObject    handle to medfi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img5=getappdata(handles.figure1,'img4');
K=medfilt2(img5,[5 5]);%???3*3?????????????????????J??????????????????
axes(handles.axes10);
imshow(K,[]);%[]??????????????????????????????
title('(e)????????????');


% --- Executes when selected object is changed in uibuttongroup2.
function uibuttongroup2_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup2 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
current_Obj=get(eventdata.NewValue,'Tag');%?????????????????????????????????tag

switch current_Obj %Switch????????????????????????????????????????????????case
    case 'radiobutton1'
        cla(handles.axes8,'reset');
    case 'radiobutton2'
        cla(handles.axes10,'reset');
    case 'radiobutton3'
        cla(handles.axes9,'reset');
end


% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(gca,'XColor','w');
set(gca,'YColor','w');%???????????????????????????
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);%???????????????
% Hint: place code in OpeningFcn to populate axes7


% --------------------------------------------------------------------
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
