package com.example;

import java.awt.AWTException;
import java.awt.Image;
import java.awt.MenuItem;
import java.awt.PopupMenu;
import java.awt.SystemTray;
import java.awt.TrayIcon;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class SystemTraySample2 {

	public static void main(String[] args) throws AWTException, IOException,
			InterruptedException {
		// SystemTrayオブジェクトの取得
		SystemTray tray = SystemTray.getSystemTray();

		Image image = ImageIO.read(new File("duke-icon.png"));

		// 右クリック時に表示されるポップアップメニュー
		PopupMenu menu = new PopupMenu();
		menu.add(new MenuItem("Duke"));
		menu.add(new MenuItem("Fang"));

		// アイコンの生成
		// ツールチップとポップアップメニューを指定する
		final TrayIcon icon = new TrayIcon(image, "I'm Duke!", menu);

		// マウス・イベント
		icon.addMouseListener(new MouseAdapter() {
			public void mousePressed(MouseEvent event) {
				if (event.getButton() == MouseEvent.BUTTON1) {
					// ポップアップメッセージの表示
					icon.displayMessage("from Duke", "Hello, World!",
							TrayIcon.MessageType.INFO);
				}
			}
		});

		tray.add(icon);

		Thread.sleep(1000);
		icon.displayMessage("CAPTION", "TEXT", TrayIcon.MessageType.WARNING);
	}

}
