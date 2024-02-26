load_audio = "C:\Users\admin\Downloads\nr_real.wav";
spectrogram_matrix=spectrogram_h(load_audio, 512, 30, 10);
% Display the spectrogram
imagesc(log(spectrogram_matrix)); % Log scale for better visualization
axis xy;
xlabel('Time (frames)');
ylabel('Frequency');
title('Spectrogram of Speech Wave');
colormap('jet');
colorbar;