function fig_handle = plotWindSpeed(fileName)
%PLOTWINDSPEED Summary of this function goes here
%   Detailed explanation goes here
lon = ncread(fileName, "XLONG");
lat = ncread(fileName, "XLAT");

u = ncread(fileName, "U10");
v = ncread(fileName, "V10");
windSpeed = sqrt(u.^2 + v.^2); 
    figure;
lon_i = lon(:, :, 1); lon1 = lon_i(:);
lat_i = lat(:, :, 1); lat1 = lat_i(:);
windSpeed_i = windSpeed(:, :, 1); windSpeed1 = windSpeed_i(:);

idx_10 = windSpeed_i > 10;
figure();
fig_handle = geoscatter(lat1(idx_10), lon1(idx_10), 3, windSpeed1(idx_10), "filled");
c = colorbar; % Add colorbar
colormap(jet); % Set a colormap
geobasemap colorterrain
clim([10 max(windSpeed1)])
c.Label.String = "Wind Speed (m/s)";
geolimits([min(lat1), max(lat1)], [min(lon1), max(lon1)]);
end