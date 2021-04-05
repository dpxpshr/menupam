package com.kh.toy.common.util.QR;

import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;

public class QRUtil {
	
	public void sendQR(String email, String URI) {
		
	}
	
	public void makeQR(String URI, String fileName, String filePath, String text) {
		try {
			BitMatrix bm = new QRCodeWriter().encode(URI, BarcodeFormat.QR_CODE, 300, 300);
			File path = new File(filePath);
			if(!path.exists()) {
				path.mkdirs();
			}
			MatrixToImageWriter.writeToStream(bm, "png", new FileOutputStream(filePath+fileName+".png"));
			
			BufferedImage image = null;
			FontMetrics metrics = null;
			image = ImageIO.read(new File(filePath+fileName+".png"));
			Graphics g = image.getGraphics();
			g.setColor(Color.BLACK);
			g.setFont(new Font("나눔스퀘어_ac Bold", Font.PLAIN, 20));
			g.drawString(text, 35, 290);
			ImageIO.write(image, "png", new File(filePath+fileName+".png"));
			g.dispose();

		} catch (WriterException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
