function varargout = RER(varargin)
% RER MATLAB code for RER.fig
%      RER, by itself, creates a new RER or raises the existing
%      singleton*.
%
%      H = RER returns the handle to a new RER or the handle to
%      the existing singleton*.
%
%      RER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RER.M with the given input arguments.
%
%      RER('Property','Value',...) creates a new RER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RER_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RER_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RER

% Last Modified by GUIDE v2.5 22-Mar-2016 20:51:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RER_OpeningFcn, ...
                   'gui_OutputFcn',  @RER_OutputFcn, ...
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


% --- Executes just before RER is made visible.
function RER_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RER (see VARARGIN)

% Choose default command line output for RER
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RER wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RER_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit4_delta_Callback(hObject, eventdata, handles)
% hObject    handle to edit4_delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4_delta as text
%        str2double(get(hObject,'String')) returns contents of edit4_delta as a double


% --- Executes during object creation, after setting all properties.
function edit4_delta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4_delta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_theta_Callback(hObject, eventdata, handles)
% hObject    handle to edit4_theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4_theta as text
%        str2double(get(hObject,'String')) returns contents of edit4_theta as a double


% --- Executes during object creation, after setting all properties.
function edit4_theta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4_theta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_alpha_Callback(hObject, eventdata, handles)
% hObject    handle to edit4_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4_alpha as text
%        str2double(get(hObject,'String')) returns contents of edit4_alpha as a double


% --- Executes during object creation, after setting all properties.
function edit4_alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_beta_Callback(hObject, eventdata, handles)
% hObject    handle to edit4_beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4_beta as text
%        str2double(get(hObject,'String')) returns contents of edit4_beta as a double


% --- Executes during object creation, after setting all properties.
function edit4_beta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4_beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4_RER.
function pushbutton4_RER_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4_RER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rer3=getappdata(0,'rer1');
rer4=getappdata(0,'rer2');
r3=abs(rer3);
r4=abs(rer4);
set(handles.edit4_alpha,'String',num2str(rer3));
set(handles.edit4_beta,'String',num2str(rer4));
if rer3 > rer4
    set(handles.dominant,'String','alpha');
else
   set(handles.dominant,'String','beta');
end
    



function dominant_Callback(hObject, eventdata, handles)
% hObject    handle to dominant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dominant as text
%        str2double(get(hObject,'String')) returns contents of dominant as a double


% --- Executes during object creation, after setting all properties.
function dominant_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dominant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
