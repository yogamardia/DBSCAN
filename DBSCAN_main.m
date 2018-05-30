function varargout = DBSCAN_main(varargin)
% DBSCAN_MAIN MATLAB code for DBSCAN_main.fig
%      DBSCAN_MAIN, by itself, creates a new DBSCAN_MAIN or raises the existing
%      singleton*.
%
%      H = DBSCAN_MAIN returns the handle to a new DBSCAN_MAIN or the handle to
%      the existing singleton*.
%
%      DBSCAN_MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DBSCAN_MAIN.M with the given input arguments.
%
%      DBSCAN_MAIN('Property','Value',...) creates a new DBSCAN_MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DBSCAN_main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DBSCAN_main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DBSCAN_main

% Last Modified by GUIDE v2.5 31-May-2018 06:34:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DBSCAN_main_OpeningFcn, ...
                   'gui_OutputFcn',  @DBSCAN_main_OutputFcn, ...
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


% --- Executes just before DBSCAN_main is made visible.
function DBSCAN_main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DBSCAN_main (see VARARGIN)

% Choose default command line output for DBSCAN_main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DBSCAN_main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DBSCAN_main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plot_btn.
function plot_btn_Callback(hObject, eventdata, handles)
% hObject    handle to plot_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function eps_txt_Callback(hObject, eventdata, handles)
% hObject    handle to eps_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eps_txt as text
%        str2double(get(hObject,'String')) returns contents of eps_txt as a double


% --- Executes during object creation, after setting all properties.
function eps_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eps_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minpts_txt_Callback(hObject, eventdata, handles)
% hObject    handle to minpts_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minpts_txt as text
%        str2double(get(hObject,'String')) returns contents of minpts_txt as a double


% --- Executes during object creation, after setting all properties.
function minpts_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minpts_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in dbscan_btn.
function dbscan_btn_Callback(hObject, eventdata, handles)
% hObject    handle to dbscan_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
global idx;

eps = str2double(get(handles.eps_txt,'String'));
minpts = str2double(get(handles.minpts_txt, 'String'));

idx=DBSCAN(data',eps,minpts);




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function openDataset_menu_Callback(hObject, eventdata, handles)
% hObject    handle to openDataset_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global data;

    filename = uigetfile('*.csv','Select Dataset (*.csv)');
    if ~isequal (filename, 0)
        data = readtable(filename);
        data = table2array(data);
        
        set(handles.dataset_table, 'Data',data, 'ColumnFormat',{'numeric'});
    else
        return;
    end
    
        

% --------------------------------------------------------------------
function help_menu_Callback(hObject, eventdata, handles)
% hObject    handle to help_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function about_menu_Callback(hObject, eventdata, handles)
% hObject    handle to about_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
