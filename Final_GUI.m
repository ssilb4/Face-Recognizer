function varargout = Final_GUI(varargin)
% FINAL_GUI MATLAB code for Final_GUI.fig
%      FINAL_GUI, by itself, creates a new FINAL_GUI or raises the existing
%      singleton*.
%
%      H = FINAL_GUI returns the handle to a new FINAL_GUI or the handle to
%      the existing singleton*.
%
%      FINAL_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_GUI.M with the given input arguments.
%
%      FINAL_GUI('Property','Value',...) creates a new FINAL_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Final_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Final_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Final_GUI

% Last Modified by GUIDE v2.5 06-Jun-2017 22:53:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Final_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Final_GUI_OutputFcn, ...
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


% --- Executes just before Final_GUI is made visible.
function Final_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Final_GUI (see VARARGIN)

% Choose default command line output for Final_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Final_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Final_GUI_OutputFcn(hObject, eventdata, handles) 
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
try
[listDB, PathName, numOfDB] = load_image();
global img;
for i = 1: numOfDB
    img{i} = imread(fullfile(PathName,'\',listDB(i).name));
end
handles.count=1;%프로그램 순서에 맞게 실행 되고 있는지 확인하기 위해 넣음.
global num_image;
num_image = 1;
axes(handles.axes9), imshow(img{num_image});
guidata(hObject, handles);

global rv;
global gv;
global bv;
global yv;
global cbv;
global crv;
global hv;
global sv;
global vv;
global hm;
global cbm;
global crm;
global hs;
global cbs;
global crs;

[hm,cbm,crm,hs,cbs,crs, cbv,crv,hv] = default( rv,gv,bv,yv,cbv,crv,hv,sv,vv);

set(handles.Mean_h,'String',hm);
set(handles.Mean_cb,'String',cbm);
set(handles.Mean_cr,'String',crm);
set(handles.Std_h,'String',hs);
set(handles.Std_cb,'String',cbs);
set(handles.Std_cr,'String',crs);
catch exception
end
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rv;
global gv;
global bv;
global yv;
global cbv;
global crv;
global hv;
global sv;
global vv;
global hm;
global cbm;
global crm;
global hs;
global cbs;
global crs;
handles.image = load_test_image();
axes(handles.axes9), imshow(handles.image);
guidata(hObject, handles);
mask = roipoly(handles.image);

[hm,cbm,crm,hs,cbs,crs,rv,gv,bv,yv,cbv,crv,hv,sv,vv] = train_mean_std(handles.image,mask,rv,gv,bv,yv,cbv,crv,hv,sv,vv)
set(handles.Mean_h,'String',hm);
set(handles.Mean_cb,'String',cbm);
set(handles.Mean_cr,'String',crm);
set(handles.Std_h,'String',hs);
set(handles.Std_cb,'String',cbs);
set(handles.Std_cr,'String',crs);


function Mean_h_Callback(hObject, eventdata, handles)
% hObject    handle to Mean_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mean_h as text
%        str2double(get(hObject,'String')) returns contents of Mean_h as a double


% --- Executes during object creation, after setting all properties.
function Mean_h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mean_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mean_cb_Callback(hObject, eventdata, handles)
% hObject    handle to Mean_cb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mean_cb as text
%        str2double(get(hObject,'String')) returns contents of Mean_cb as a double




% --- Executes during object creation, after setting all properties.
function Mean_cb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mean_cb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Mean_cr_Callback(hObject, eventdata, handles)
% hObject    handle to Mean_cr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Mean_cr as text
%        str2double(get(hObject,'String')) returns contents of Mean_cr as a double


% --- Executes during object creation, after setting all properties.
function Mean_cr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Mean_cr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function Std_h_Callback(hObject, eventdata, handles)
% hObject    handle to Std_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Std_h as text
%        str2double(get(hObject,'String')) returns contents of Std_h as a double


% --- Executes during object creation, after setting all properties.
function Std_h_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Std_h (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Std_cb_Callback(hObject, eventdata, handles)
% hObject    handle to Std_cb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Std_cb as text
%        str2double(get(hObject,'String')) returns contents of Std_cb as a double


% --- Executes during object creation, after setting all properties.
function Std_cb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Std_cb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Std_cr_Callback(hObject, eventdata, handles)
% hObject    handle to Std_cr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Std_cr as text
%        str2double(get(hObject,'String')) returns contents of Std_cr as a double


% --- Executes during object creation, after setting all properties.
function Std_cr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Std_cr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% if handles.count==3
try
global ori_img;
global img_arr;
set(handles.result1,'String',0);
set(handles.result2,'String',0);

cla(handles.axes6, 'reset');
cla(handles.axes7, 'reset');

guidata(hObject, handles);
[img_arr, ori_img] = load_test_image();

% else
%     msgbox('You did not proceed in order or the previous step did not work','Warning');
% end
axes(handles.axes6), imshow(img_arr);
guidata(hObject, handles);
catch exeption
end
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%각 rgb에 대한 Distance Map
if handles.count==4
    src = imread(handles.src);
    [h,w,c]=size(src);
    src = rgb2ycbcr(src);
    img=double(src);
    rm=double(handles.rm);
    gm=double(handles.gm);
    bm=double(handles.bm);
    DistanceMap = sqrt((img(:,:,1)-rm).^2 + (img(:,:,2)-gm).^2 + (img(:,:,3)-bm).^2);
    for i = 1 : h
        for j = 1 : w
          if (DistanceMap(i, j) < 120)
                DistanceMap(i, j) = 1;
          else
              DistanceMap(i, j) = 0;
          end
        end
    end
    handles.DM=DistanceMap;
    axes(handles.axes7),imshow(DistanceMap);
    handles.count=5;
    guidata(hObject, handles);
else
    msgbox('You did not proceed in order or the previous step did not work','Warning');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%이 if문 사이에 face detection 알고리즘을 넣으면 됩니다.
% if handles.count==4
    %handles.face=ooo;
    try
    global result_mask;
    global ori_img;
    global img_arr;
    
    cla(handles.axes7, 'reset');
    
    [result_mask,face_image] = test_images(img_arr);
    axes(handles.axes7), imshow(face_image);
    guidata(hObject, handles);
% else%다른 handles.count값이 들어오면 이 알고리즘이 실행되지 않으므로 아래 같이 에러 송출
%     msgbox('You did not proceed in order or the previous step did not work','Warning');
% end
    catch exception
    end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%여기는 Threshold를 기준으로 face detection된 이미지를 처리한다.
%edit12의 입력 값을 Threshold값으로 불러와서 처리한다. 
if handles==6
    t=str2num(get(handles.edit12,'String'));%Threshold값을 받아온다. 이 아래엔 
    %이미지 사이즈를 구하고 t에 따라 Threshold연산을 하면 된다.
    %face detection된 이미지는 handles.face에 저장된다. 
    %handles.face는 이미 imread된 값을 가져오는 것이므로 따로 imread를 할 필요 없다.
    
    
    handles.count=7;
else
    msgbox('You did not proceed in order or the previous step did not work','Warning');
end




function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in edit13.
function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns edit13 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from edit13

%gui중 Morphorogy에 관한 popmenu 값을 받아온다.
% type = get(handles.edit13, 'String');
% key = get(handles.edit13, 'Value');



% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%edit13의 값을 받아와서 Morphology를 수행하도록 만든다.
%type = str2nm(get(handles.edit13,'String');
%se = strel('sqaure',5);

try
global result_mask;
Oval = result_mask;
global ori_img;
global distance;
image=imread(ori_img);
type = get(handles.edit13,'String');
key = get(handles.edit13,'Value');
select_type = type{key};
    se = strel('square',5);
    if strcmp(select_type,'Erode')
        img=imerode(image,se);
    elseif strcmp(select_type,'Dilation')
        img=imdilate(image,se);
    elseif strcmp(select_type,'Opening')
        img_Erode=imerode(image,se);
        img=imdilate(img_Erode,se);
    elseif strcmp(select_type,'Closing')
        img_imdilaton=imdilate(image,se);
        img=imerode(img_imdilaton,se);
    end    
    image=img;


hsv_img = rgb2hsv(image);
[rm, gm, bm] = rgbm(hsv_img, result_mask);
DistanceMap = myDistanceMap(hsv_img,rm, gm, bm);
[hsv_img, DistanceMap] = finish(DistanceMap, Oval, image);
axes(handles.axes7), imshow(hsv_img);
guidata(hObject, handles);
distance = DistanceMap;
catch exeption
end
    
% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)%Reset statement
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% [h,w,c] = size(handles.src);
% k=ones(h,w);
% 
% axes(handles.axes1),imshow(k);
% axes(handles.axes6),imshow(k);
% axes(handles.axes7),imshow(k);
try
set(findall(gcf,'style','edit'),'string','');

cla(handles.axes6, 'reset');
cla(handles.axes7, 'reset');
cla(handles.axes9, 'reset');
guidata(hObject, handles);
catch exception
end

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
msgbox({'The order of operation is as labeled but except "next" stage.','The command works like a tile.','If you had a problem, Error message will be shown.','Next show all image in the DB. If you want see some image in the DB, you press that butoon and will see image'});
guidata(hObject, handles);
catch exception
end

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.count==2
    [filename, path] = uigetfile('*.bmp');
    src=imread(filename);
    axes(handles.axes9),imshow(src);
    mask = roipoly(src);
    src=double(src);
    [r00, g00, b00] = rgbm(src,mask);

    rm=(handles.rm + r00)/2;
    gm=(handles.gm + g00)/2;
    bm=(handles.bm + b00)/2;
    handles.rm=rm;
    handles.gm=gm;
    handles.bm=bm;
    
    handles.count=3;%Load Test Image를 실행 시키기 위해 선언
    
    set(handles.Mean_h,'String',handles.rm);
    set(handles.Mean_cb,'String',handles.gm);
    set(handles.Mean_cr,'String',handles.bm);
    
    rs = sqrt(((handles.r11-handles.rm).^2 + (handles.r12-handles.rm).^2 + (handles.r13-handles.rm).^2 + (handles.r14-handles.rm).^2 + (handles.r15-handles.rm).^2 + (handles.r16-handles.rm).^2 + (handles.r17-handles.rm).^2 + (handles.r18-handles.rm).^2 + (handles.r19-handles.rm).^2 + (handles.r20-handles.rm).^2 + (handles.r21-handles.rm) + (handles.r22-handles.rm) + (handles.r23-handles.rm) + (handles.r24-handles.rm) + (handles.r25-handles.rm) + (handles.r26-handles.rm) + (handles.r27-handles.rm) + (handles.r28-handles.rm) + (handles.r29-handles.rm) + (handles.r30-handles.rm) + (handles.r31-handles.rm) + (handles.r32-handles.rm) + (handles.r33-handles.rm) + (handles.r34-handles.rm) + (handles.r35-handles.rm) + (handles.r36-handles.rm) + (handles.r37-handles.rm) + (handles.r38-handles.rm) + (handles.r39-handles.rm) + (handles.r40-handles.rm) + (handles.r41-handles.rm) + (handles.r42-handles.rm) + (handles.r43-handles.rm))/33);
    gs = sqrt(((handles.g11-handles.gm).^2 + (handles.g12-handles.gm).^2 + (handles.g13-handles.gm).^2 + (handles.g14-handles.gm).^2 + (handles.g15-handles.gm).^2 + (handles.g16-handles.gm).^2 + (handles.g17-handles.gm).^2 + (handles.g18-handles.gm).^2 + (handles.g19-handles.gm).^2 + (handles.g20-handles.gm).^2 + (handles.g21-handles.gm) + (handles.g22-handles.gm) + (handles.g23-handles.gm) + (handles.g24-handles.gm) + (handles.g25-handles.gm) + (handles.g26-handles.gm) + (handles.g27-handles.gm) + (handles.g28-handles.gm) + (handles.g29-handles.gm) + (handles.g30-handles.gm) + (handles.g31-handles.gm) + (handles.g32-handles.gm) + (handles.g33-handles.gm) + (handles.g34-handles.gm) + (handles.g35-handles.gm) + (handles.g36-handles.gm) + (handles.g37-handles.gm) + (handles.g38-handles.gm) + (handles.g39-handles.gm) + (handles.g40-handles.gm) + (handles.g41-handles.gm) + (handles.g42-handles.gm) + (handles.g43-handles.gm))/33);
    bs = sqrt(((handles.b11-handles.bm).^2 + (handles.b12-handles.bm).^2 + (handles.b13-handles.bm).^2 + (handles.b14-handles.bm).^2 + (handles.b15-handles.bm).^2 + (handles.b16-handles.bm).^2 + (handles.b17-handles.bm).^2 + (handles.b18-handles.bm).^2 + (handles.b19-handles.bm).^2 + (handles.b20-handles.bm).^2 + (handles.b21-handles.bm) + (handles.b22-handles.bm) + (handles.b23-handles.bm) + (handles.b24-handles.bm) + (handles.b25-handles.bm) + (handles.b26-handles.bm) + (handles.b27-handles.bm) + (handles.b28-handles.bm) + (handles.b29-handles.bm) + (handles.b30-handles.bm) + (handles.b31-handles.bm) + (handles.b32-handles.bm) + (handles.b33-handles.bm) + (handles.b34-handles.bm) + (handles.b35-handles.bm) + (handles.b36-handles.bm) + (handles.b37-handles.bm) + (handles.b38-handles.bm) + (handles.b39-handles.bm) + (handles.b40-handles.bm) + (handles.b41-handles.bm) + (handles.b42-handles.bm) + (handles.b43-handles.bm))/33);
    
    set(handles.Std_h,'String',rs);
    set(handles.Std_cb,'String',gs);
    set(handles.Std_cr,'String',bs);
    
    guidata(hObject, handles);
else
    msgbox('You did not proceed in order or the previous step did not work','Warning');
end
% src = imread('nsys_004.jpg');
% mask = imread('nsys_004_mask.bmp');
% [r14, g14, b14] = rgbm(src,mask);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%if handles.count==2 && handles.fornext==1 %handles.fornext는 traning button에 있다.
try
global num_image;
global img;
num_image = num_image+1;
axes(handles.axes9), imshow(img{num_image});
guidata(hObject, handles);
catch exception
end


function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double


% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[listDB, PathName, numOfDB] = load_image();
global mask_img;
for i = 1: numOfDB
    mask_img{i} = imread(fullfile(PathName,'\',listDB(i).name));
end
figure(3),imshow(mask_img{1});


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try 
global distance;
[handles.img_arr, ori_img] = load_test_image();
Ori_mask = imread(fullfile(handles.img_arr));
[result_1, result_2]=accuracy(Ori_mask, distance);
set(handles.result1,'String',result_1);
set(handles.result2,'String',result_2);
catch exception
end



function result1_Callback(hObject, eventdata, handles)
% hObject    handle to result1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result1 as text
%        str2double(get(hObject,'String')) returns contents of result1 as a double


% --- Executes during object creation, after setting all properties.
function result1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function result2_Callback(hObject, eventdata, handles)
% hObject    handle to result2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result2 as text
%        str2double(get(hObject,'String')) returns contents of result2 as a double


% --- Executes during object creation, after setting all properties.
function result2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
