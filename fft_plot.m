function varargout = fft_plot(varargin)
% FFT_PLOT MATLAB code for fft_plot.fig
%      FFT_PLOT, by itself, creates a new FFT_PLOT or raises the existing
%      singleton*.
%
%      H = FFT_PLOT returns the handle to a new FFT_PLOT or the handle to
%      the existing singleton*.
%
%      FFT_PLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FFT_PLOT.M with the given input arguments.
%
%      FFT_PLOT('Property','Value',...) creates a new FFT_PLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fft_plot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fft_plot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fft_plot

% Last Modified by GUIDE v2.5 22-Mar-2016 16:26:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fft_plot_OpeningFcn, ...
                   'gui_OutputFcn',  @fft_plot_OutputFcn, ...
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


% --- Executes just before fft_plot is made visible.
function fft_plot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fft_plot (see VARARGIN)

% Choose default command line output for fft_plot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fft_plot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fft_plot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in fft_button.
function fft_button_Callback(hObject, eventdata, handles)
% hObject    handle to fft_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=512;
n_points2=getappdata(0,'n_points1');
if mod(n_points2,2)~=0
    n_points2=n_points2-1;
else 
    n_points2=n_points2;
end

vs2=getappdata(0,'vs1');
bin_val = [0 : n_points2-1];
n2=n_points2/2;
frequency_axis=bin_val/n2;
setappdata(0,'frequency_axis1',frequency_axis);
z = fftshift(fft(vs2));
z1=abs(z);
psd=z1.^2;
setappdata(0,'psd1',psd);

setappdata(0,'n_points3',n_points2);

setappdata(0,'n2_1',n2);




axes(handles.plot_fft);
plot(frequency_axis(1:n2),psd(n2:n_points2-1));
title('power spectrum');
xlabel('frequency(normalized)');
ylabel('powerVolts^2/Hz');
grid on;
grid minor;


% --- Executes on button press in next2.
function next2_Callback(hObject, eventdata, handles)
filter_plot;
% hObject    handle to next2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
