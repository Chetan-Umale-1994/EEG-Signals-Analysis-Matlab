function varargout = filter_plot(varargin)
% FILTER_PLOT MATLAB code for filter_plot.fig
%      FILTER_PLOT, by itself, creates a new FILTER_PLOT or raises the existing
%      singleton*.
%
%      H = FILTER_PLOT returns the handle to a new FILTER_PLOT or the handle to
%      the existing singleton*.
%
%      FILTER_PLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTER_PLOT.M with the given input arguments.
%
%      FILTER_PLOT('Property','Value',...) creates a new FILTER_PLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filter_plot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filter_plot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filter_plot

% Last Modified by GUIDE v2.5 22-Mar-2016 23:50:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filter_plot_OpeningFcn, ...
                   'gui_OutputFcn',  @filter_plot_OutputFcn, ...
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


% --- Executes just before filter_plot is made visible.
function filter_plot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filter_plot (see VARARGIN)

% Choose default command line output for filter_plot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filter_plot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filter_plot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in filter_apply.
function filter_apply_Callback(hObject, eventdata, handles)
% hObject    handle to filter_apply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=0.1/256;
f2=3/256;
f3=4/256;
f4=7/256;
f5=8/256;
f6=12/256;
f7=13/256;
f8=30/256;
frequency_axis2=getappdata(0,'frequency_axis1');
psd2=getappdata(0,'psd1');
n2_2=getappdata(0,'n2_1');
n_points4=getappdata(0,'n_points3');
pre_filter=psd2(n2_2:n_points4-1);

[b1 a1]=butter(1,[f1 f2] ,'bandpass');
[b2 a2]=butter(1,[f3 f4],'bandpass');
[b3 a3]=butter(1,[f5 f6] ,'bandpass');
[b4 a4]=butter(1,[f7 f8],'bandpass');

post_filter1=filter(b1,a1,pre_filter);
post_filter2=filter(b2,a2,pre_filter);
post_filter3=filter(b3,a3,pre_filter);
post_filter4=filter(b4,a4,pre_filter);

axes(handles.delta);
plot(frequency_axis2(1:n2_2),post_filter1);
title('Delta');
xlabel('frequency(normalized)');
ylabel('power(Volts^2/Hz)');
grid on;
grid minor;

axes(handles.theta);
plot(frequency_axis2(1:n2_2),post_filter2);
title('Theta');
xlabel('frequency(normalized)');
ylabel('power(Volts^2/Hz)');
grid on;
grid minor;

axes(handles.alpha);
plot(frequency_axis2(1:n2_2),post_filter3);
title('Alpha');
xlabel('frequency(normalized)');
ylabel('power(Volts^2/Hz)');
grid on;
grid minor;

axes(handles.beta);
plot(frequency_axis2(1:n2_2),post_filter4);
title('Beta');
xlabel('frequency(normalized)');
ylabel('power(Volts^2/Hz)');
grid on;
grid minor;

area1=trapz(frequency_axis2(1:n2_2),post_filter1);
area2=trapz(frequency_axis2(1:n2_2),post_filter2);
area3=trapz(frequency_axis2(1:n2_2),post_filter3);
area4=trapz(frequency_axis2(1:n2_2),post_filter4);

esd_delta=abs(area1)/3;
esd_theta=abs(area2)/3;
esd_alpha=abs(area3)/4;
esd_beta=abs(area4)/17;

total_power=esd_delta+esd_theta+esd_alpha+esd_beta;
rer_alpha=log10((esd_alpha/total_power));
rer_beta=log10((esd_beta/total_power));
setappdata(0,'rer1',rer_alpha);
setappdata(0,'rer2',rer_beta);



% --- Executes on button press in next3.
function next3_Callback(hObject, eventdata, handles)
% hObject    handle to next3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RER;
