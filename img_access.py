>>> import nibabel as nb
>>> img = nb.load('test.nii')
>>> img.get_affine()
array([[  -3.5  ,    0.   ,    0.   ,   68.25 ],
       [   0.   ,    3.75 ,    0.   , -118.125],
       [   0.   ,    0.   ,    3.75 , -118.125],
       [   0.   ,    0.   ,    0.   ,    1.   ]])
>>> meta = img.get_header()
>>> meta.get_zooms()
(3.5, 3.75, 3.75, 2.5)
>>> meta.keys()
['sizeof_hdr', 'data_type', 'db_name', 'extents', ...]
>>> data = img.get_data()
>>> data.shape
(40, 64, 64, 1452)
