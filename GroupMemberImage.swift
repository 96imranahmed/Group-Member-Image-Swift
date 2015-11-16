class func processImageCreate(count: Int, _ imagearray:[UIImage] = []) -> UIImage {
        switch count {
        case 1:
            return imagearray[0];
        case 2:
            let leftimage:UIImage! = self.cropimage(imagearray[0], toRect: CGRectMake(0, 0, imagearray[0].size.width/2, imagearray[0].size.height));
            let rightimage:UIImage! = self.cropimage(imagearray[1], toRect: CGRectMake(imagearray[0].size.width/2, 0, imagearray[0].size.width/2, imagearray[0].size.height));
            let size:CGSize = imagearray[0].size;
            UIGraphicsBeginImageContext(size);
            leftimage.drawInRect(CGRectMake(0, 0, imagearray[0].size.width/2, imagearray[0].size.height));
            rightimage.drawInRect(CGRectMake(imagearray[0].size.width/2, 0, imagearray[0].size.width/2, imagearray[0].size.height));
            let finalimage:UIImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return finalimage;
        case 3:
            let leftimage:UIImage! = self.cropimage(imagearray[0], toRect: CGRectMake(0, 0, imagearray[0].size.width/2, imagearray[0].size.height));
            let righttopimage:UIImage! = imagearray[1];
            let rightbottomimage:UIImage! = imagearray[2];
            let size:CGSize = imagearray[0].size;
            UIGraphicsBeginImageContext(size);
            leftimage.drawInRect(CGRectMake(0, 0, imagearray[0].size.width/2, imagearray[0].size.height));
            righttopimage.drawInRect(CGRectMake(imagearray[0].size.width/2, 0, imagearray[0].size.width/2, imagearray[0].size.height/2));
            rightbottomimage.drawInRect(CGRectMake(imagearray[0].size.width/2, imagearray[0].size.height/2, imagearray[0].size.width/2, imagearray[0].size.height/2));
            let finalimage:UIImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return finalimage;
        case 4:
            let lefttopimage:UIImage! = imagearray[0];
            let leftbottomimage:UIImage! = imagearray[1];
            let righttopimage:UIImage! = imagearray[2];
            let rightbottomimage:UIImage! = imagearray[3];
            let size:CGSize = imagearray[0].size;
            UIGraphicsBeginImageContext(size);
            lefttopimage.drawInRect(CGRectMake(0, 0, imagearray[0].size.width/2, imagearray[0].size.height/2));
            leftbottomimage.drawInRect(CGRectMake(0, imagearray[0].size.height/2, imagearray[0].size.width/2, imagearray[0].size.height/2));
            righttopimage.drawInRect(CGRectMake(imagearray[0].size.width/2, 0, imagearray[0].size.width/2, imagearray[0].size.height/2));
            rightbottomimage.drawInRect(CGRectMake(imagearray[0].size.width/2, imagearray[0].size.height/2, imagearray[0].size.width/2, imagearray[0].size.height/2));
            let finalimage:UIImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            return finalimage;
            
        default:
            return UIImage(named: "unknownprofile.png")!;
        }
        
    }
    class func cropimage(imageToCrop:UIImage, toRect rect:CGRect) -> UIImage{
        let imageRef:CGImageRef = CGImageCreateWithImageInRect(imageToCrop.CGImage, rect)!
        let cropped:UIImage = UIImage(CGImage:imageRef);
        return cropped
    }
