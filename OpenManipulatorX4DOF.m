function varargout = OpenManipulatorX4DOF(varargin)
% OPENMANIPULATORX4DOF MATLAB code for OpenManipulatorX4DOF.fig
%      OPENMANIPULATORX4DOF, by itself, creates a new OPENMANIPULATORX4DOF or raises the existing
%      singleton*.
%
%      H = OPENMANIPULATORX4DOF returns the handle to a new OPENMANIPULATORX4DOF or the handle to
%      the existing singleton*.
%
%      OPENMANIPULATORX4DOF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPENMANIPULATORX4DOF.M with the given input arguments.
%
%      OPENMANIPULATORX4DOF('Property','Value',...) creates a new OPENMANIPULATORX4DOF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OpenManipulatorX4DOF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OpenManipulatorX4DOF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OpenManipulatorX4DOF

% Last Modified by GUIDE v2.5 05-Oct-2022 08:57:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @OpenManipulatorX4DOF_OpeningFcn, ...
                   'gui_OutputFcn',  @OpenManipulatorX4DOF_OutputFcn, ...
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


% --- Executes just before OpenManipulatorX4DOF is made visible.
function OpenManipulatorX4DOF_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OpenManipulatorX4DOF (see VARARGIN)

% Choose default command line output for OpenManipulatorX4DOF
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OpenManipulatorX4DOF wait for user response (see UIRESUME)
% uiwait(handles.figure1);
jinit=[90;60;-120;60];%toa do ban dau
assignin('base','jinit',jinit); 

axes(handles.axes1);
FKdraw(jinit(1,1),jinit(2,1),jinit(3,1),jinit(4,1));
ax_properties = get(gca);
assignin('base','pov',ax_properties.View);

% --- Outputs from this function are returned to the command line.
function varargout = OpenManipulatorX4DOF_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%% FK
% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val2=str2num(get(handles.text2,'String'));
val3=str2num(get(handles.text3,'String'));
val4=str2num(get(handles.text4,'String'));
val1 = get(hObject,'Value') ;
val=[val1;val2;val3;val4];
assignin('base','val',val);
set( handles.text1,'String', num2str(val1,3) );
axes(handles.axes1);
FKdraw(val1,val2,val3,val4);
view(evalin('base','pov'));

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
val1=str2num(get(handles.text1,'String'));
val3=str2num(get(handles.text3,'String'));
val4=str2num(get(handles.text4,'String'));
val2 = get(hObject,'Value') ;
val=[val1;val2;val3;val4];
assignin('base','val',val);
set( handles.text2,'String', num2str(val2,3) );
axes(handles.axes1);
FKdraw(val1,val2,val3,val4);
view(evalin('base','pov'));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val1=str2num(get(handles.text1,'String'));
val2=str2num(get(handles.text2,'String'));
val4=str2num(get(handles.text4,'String'));
val3 = get(hObject,'Value') ;
val=[val1;val2;val3;val4];
assignin('base','val',val);
set( handles.text3,'String', num2str(val3,3) );
axes(handles.axes1);
FKdraw(val1,val2,val3,val4);
view(evalin('base','pov'));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val1=str2num(get(handles.text1,'String'));
val2=str2num(get(handles.text2,'String'));
val3=str2num(get(handles.text3,'String'));
val4 = get(hObject,'Value') ;
val=[val1;val2;val3;val4];
assignin('base','val',val);
set( handles.text4,'String', num2str(val4,3) );
axes(handles.axes1);
FKdraw(val1,val2,val3,val4);
view(evalin('base','pov'));

% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in btnReset.
function btnReset_Callback(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
jinit=evalin('base','jinit');
FKdraw(jinit(1,1),jinit(2,1),jinit(3,1),jinit(4,1));
set( handles.text1,'String', num2str(90) );
set( handles.text2,'String', num2str(60) );
set( handles.text3,'String', num2str(-120) );
set( handles.text4,'String', num2str(60) );

% --- Executes during object creation, after setting all properties.
function btnReset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over slider2.
function slider2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
