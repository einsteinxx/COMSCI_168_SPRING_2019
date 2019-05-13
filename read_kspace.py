#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr 17 21:23:00 2019

@author: kgonzalez
"""
import numpy as np
import scipy.fftpack as fftp
from scipy.io import loadmat
import matplotlib.pyplot as plt
from numpy.fft import fftshift, ifftshift, fftn, ifftn
#import scipy.misc
import imageio


def read_kspace():
    x = loadmat('phantom_data.mat')
    data= x['kData']
    
    
    x,y,num_slices = data.shape #get last entry for slices available
    image_data = np.zeros([x,y,num_slices],dtype=complex)
    
    for ii in range(0,num_slices):
        image_data[:,:,ii] =  transform_kspace_to_image(data[:,:,ii])
        imageio.imwrite('IMAGES/outfile' + print('{:02}'.format(ii)),
                        image_data[:,:,ii].real,'png')
        
    
#    img =transform_kspace_to_image(data[:,:,0])
#    
#    
#    plt.close('all')
#    plt.imshow(img.real,cmap = 'bone'); plt.colorbar()
#    imageio.imwrite('IMAGES/outfile.png', img.real,'png')
#    
#    plt.figure()
#    plt.imshow(img.imag,cmap = 'bone'); plt.colorbar()
#    c = fftp.ifft(data[:,:,0])
#    
#    f1 = plt.figure()
#    plt.imshow(c)
#    
#    f2 = plt.figure()
#    plt.imshow(data[:,:,0].real,cmap = 'bone')
#    plt.colorbar()



def transform_kspace_to_image(k, dim=None, img_shape=None):
    """ Computes the Fourier transform from k-space to image space
    along a given or all dimensions
    :param k: k-space data
    :param dim: vector of dimensions to transform
    :param img_shape: desired shape of output image
    :returns: data in image space (along transformed dimensions)
    """
    if not dim:
        dim = range(k.ndim)

    img = fftshift(ifftn(ifftshift(k, axes=dim), s=img_shape, axes=dim), axes=dim)
    img *= np.sqrt(np.prod(np.take(img.shape, dim)))
    return img
