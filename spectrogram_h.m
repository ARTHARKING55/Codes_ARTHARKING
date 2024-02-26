% This function is the simpler version of the fucntion spectrogram(x)
% function in matlab.
% This is not made with an intension of commercial use.
% Feel free for research and study purpose.
%
% Input Parameters
% audio_path = Path to  audio file (eg. "C:\Users\admin\Downloads\nr_real.wav")
% NFFT = Number of frames of speech samples
% window_size = Size of speech window (in ms) {Typically between 10-30 ms}
% window_shift = Size of speech window shift (in ms)
%
% Other Parameters
% speech = Speech Signal extracted from path 
% Fs = Sampling frequency of the signal in Hz
% window_size_samples = Number of samples per frame
% window_shift_samples = Number of samples overlap between the frames
% num_frames = Total Number of frames of samples
%
% Output Parameter
% spectrogram_matrix = Output Parameter 
%
% Credits
% This function is created by Arth J. Shah, DA-IICT, Gujarat
% Date:- 26/02/2024

function [spectrogram_matrix]=spectrogram_h(audio_path, NFFT, window_size, window_shift)
    % Read the audio file
    [speech, Fs] = audioread(audio_path);
    
    % Convert window size and shift from milliseconds to samples
    window_size_samples = round(window_size * Fs / 1000);
    window_shift_samples = round(window_shift * Fs / 1000);
    
    % Calculate the number of frames
    num_frames = floor((length(speech) - window_size_samples) / window_shift_samples) + 1;
    
    % Initialize the spectrogram matrix
    spectrogram_matrix = zeros(NFFT/2 + 1, num_frames);
    
    % Compute spectrogram
    for i = 1:num_frames
        % Extract current frame
        frame = speech((i-1)*window_shift_samples + 1 : (i-1)*window_shift_samples + window_size_samples);
        
        % Apply window function
        windowed_frame = frame .* hamming(window_size_samples);
        
        % Compute FFT
        fft_frame = fft(windowed_frame, NFFT);
        
        % Compute magnitude squared
        mag_squared = abs(fft_frame(1:NFFT/2 + 1)).^2;
        
        % Store in spectrogram matrix
        spectrogram_matrix(:, i) = mag_squared;
    end
end
