
## 📁 Folder Structure

```
DeepCrack/
├── train_img/       # Input images for training
├── train_lab/       # Ground truth masks for cracks (labels)
├── resizeImages.m   # Script to resize all images and masks to 256x256
├── mainDeepCrackPipeline.m
├── runDeepCrackPipeline.m
├── trainDeepCrackUNet.m
├── predictCracks.m  # (Optional) For testing on new images
├── trainedModel.mat # (Generated after training)
```

---

## 🚀 Pipeline Overview

### 1. 🖼️ Image & Mask Preprocessing

First, we resize all images and masks to a standard size (256x256) so they can be used in training.

```matlab
resizeImages;
```

✔️ Output: Resized images and masks stored in folders like `DeepCrackResized/train_img/` and `train_lab/`.

---

### 2. 📦 Set up Training Datastores

```matlab
mainDeepCrackPipeline;
```

This script:
- Reads image & label pairs
- Creates image and pixel label datastores
- Prepares the dataset for training

---

### 3. 🧠 Train the U-Net Model

```matlab
runDeepCrackPipeline;
```

Inside it, we call:

```matlab
trainDeepCrackUNet;
```

This function:
- Defines a U-Net architecture (good for segmentation)
- Trains it using the training dataset
- Saves the trained model as `trainedModel.mat`

🟢 Once training is complete, you're ready to test and evaluate!

---

### 4. 🔍 Test the Model

To test the trained model on new images:

```matlab
newImg = imread('path_to_new_image.jpg');
predMask = semanticseg(newImg, trainedModel);
imshow(labeloverlay(newImg, predMask));
```

---

## 📈 Why Deep Segmentation Over Linear Regression?

> “Instead of predicting just one number or line, deep segmentation helps us **find cracks pixel by pixel**, like painting them with a smart brush. That’s way more accurate for real inspection!”

---

## 🎯 Real-World Applications

- 🚧 Road & bridge inspection (using drones or mobile devices)
- 🏗️ Construction quality monitoring
- 🌉 Structural health monitoring systems
- 🛰️ Satellite image analysis for infrastructure

---

## 💡 What to Do After Training

- ✅ Test on new or custom images
- ✅ Try with a different dataset
- ✅ Improve accuracy by augmenting data
- ✅ Deploy on edge devices or build a web demo

---

## 🔄 Optional: Save & Load Models

```matlab
save('trainedModel.mat', 'trainedNet');
load('trainedModel.mat');
```

---
