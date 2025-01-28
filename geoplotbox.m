function [lat_1, lat_2, lon_1, lon_2] = geoplotbox(center, xwidth_deg, ywidth_deg)
%GEOPLOTBOX Summary of this function goes here
%   Detailed explanation goes here

lat_1 = center(1) + ywidth_deg/2;
lat_2 = center(1) - ywidth_deg/2;
lon_1 = center(2) + xwidth_deg/2;
lon_2 = center(2) - xwidth_deg/2;

lats = [lat_1; lat_1; lat_2; lat_2; lat_1];
lons = [lon_1; lon_2; lon_2; lon_1; lon_1];

geoplot(lats, lons)

end