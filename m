Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B4F4E4305
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 21:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025502; cv=none; b=mg/rPnRurn9+XanNXd/3p9dwU6dK9mO/H3KzzkHZG4dVFSxSL/OaRTZtaveXzEFGzlwROle97o3TQ55aAiiMULQvNfi7C0wKXelrOj6TrMwUbOLL0bOoh31GNMebnnC34mXaz7UxBYJCGQzhX3w4nLM152ZYd+1O88rSbQpkY58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025502; c=relaxed/simple;
	bh=qqUhYyhh0lWhKWnrQLYI0jwX7c0FSpVeehdl6bHeJFk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BHupFC4nhpB5tlrAJ5irCFss0c8J0xf1QYGfSXoeFxw0m0LS+LUfvkw+TVkvwS+5+Bx3NQn4q4pPSWGEquKpfA+qC6cjKnbQMfal4ZifLo5MpN08pyfb+jJgxvjpsZ2JMSWpx3rplF7JS1yqVPncjosKgEojj1faafwCW/Et2+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=1od0JZOo; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="1od0JZOo"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530d0d5ae11so35968371cf.0
        for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 14:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790025500; x=1790630300; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1DBFyCtj/TBpWi0ynhywHcDx+OLl9aX7xs9S/Wz1mw=;
        b=1od0JZOo8POfDsqin6TU9hQfXWbUQanXMGXDVWZPsJ81M/o/5q4eSHNeYAZ/JupN4Q
         p0KLwBnxMgwNBGrK11dVew9uP46B+HPrLqF21xJW35ehLq7Wxc2jFFTNVU26zs+XFA/v
         EJf6s0yY4Z/hX+BbNU5TCvyhBDxeC6wZXW4ytYDOi4XdOMxr5YcFvKF/tH5Gp5Nj4Pd9
         fj+8kcqZR767b0inBes11oZwjnGaAFHAP7Gbe1mgcRGccWRCoztRKM0F5pYDGR6JPZi2
         W2J8hwmAbHfHMnhEAZp/8J/+fM61qUVvyt3nzA+vSvtyTHgCbneEV8yjpNtl6MzJ1gjE
         rI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790025500; x=1790630300;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1DBFyCtj/TBpWi0ynhywHcDx+OLl9aX7xs9S/Wz1mw=;
        b=NJ2mFDfiEMgfPqLKyYNHGBtd1wWUHgS4/cDZOitlgUL/B60RSFFj5kg4vNJsv3YjC0
         b7W94KgbbhbzZfAMIgZOKk9iyLQWMWfeySYllCdFtrrpaUIA+EwuNZGCSChR0i3ieRHA
         xXOkre1Wfnl8W1m8MViFbHrwL/6va0/icwmggJnQCK0YEKxclmM7ROsfvuGjHomgSxuo
         4y95g8mrF1hDCCWQ0S1OGfANh3ncAYwsLMEpyv/VTy3WGDd9NQGMpXIbeairUGbDX0rm
         nPloOd9ChQbb7HrUZhZGaR6x/EYSCN+wfFU5Di9c+BY8+srjymjFHT1Pag2j4CnV/SNS
         hsAw==
X-Forwarded-Encrypted: i=1; AKwUvBxLkOJDlHyrvJUDgxCs832hV7DlPno4PAcvEKK0Mm5QRlRfshFaraHsu99KQGOuHUHZlKos4i3ygBFjwQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lio/sAioTqB/yMHve81XZAa5kQT0gFp52nVmXRPjpyavNbPvth
	BTxmsnAUqRjAFQ261kgDrr2rtedkr5XpZg7628CXeo1TWLwuHHNPKXySMt6YExDV8TdWktmK/VY
	UCIEKnXRQ1rFyk4SKO0So8lJo+JF7bR7rNm7x+pNMHhUDtVAyp5JQWs/IXA==
X-Gm-Gg: AYBFou0UKwMTroM4PI3XNttGv2KCeDBNLg9XsuVWoGljPA8SwgGMIvJylxyhhDqu1Bf
	LWlUGo4utZ/VFIKQbRiMNAxrGSr9/F42GGoMaD6YX7GsH6dHeLJZJBNvEPLr63KFv2gd+IqjTDw
	Cw33xOdEy3fwFs3DSM3rAU1dxuYNkUmQDFr5hE56YpGVpY5cKQgQ3+82FHNIB5GksN8+fkbKBHT
	5MuddRDBdrXg4/4vAUXTkyTbhzbeE8xDiw1D77zhAyO2LYcj2Xe9EQMemb3EJZ4VspGNv2R1mvL
	cohhqSBcpDmKxAfb4NIk+p2q2ZViv3/avODTGMFkKTZBymQ6U1X/caVJn0p25AKnNTk1rVnf7Hi
	ExuDsbBDcgpc5GzlghprnIGti/35xy8IkrWQU/Hm0R7WUlB+JVFwbrvRtOQxIhWgZ8KXjAVXACE
	Pp3KJYrz6Sb4hqXaKK+docoOD0mCCOuBUH+2gdd82HGuiFMZ0EvCIpxF4qQ34/k6I=
X-Received: by 2002:ac8:5882:0:b0:51c:fc4:a144 with SMTP id d75a77b69052e-532d8d3182bmr26212061cf.4.1790025499820;
        Mon, 21 Sep 2026 14:18:19 -0700 (PDT)
Received: from strozzi ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532df63ab0dsm267121cf.26.2026.09.21.14.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:18:19 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	Sean Anderson <sanderson@brivo.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Franky Lin <franky.lin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"John W. Linville" <linville@tuxdriver.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	driver-core@lists.linux.dev
Subject: [PATCH 0/4] wifi: brcmfmac: Fix bugs when the device is removed before firmware is loaded
Date: Mon, 21 Sep 2026 17:18:10 -0400
Message-ID: <20260921211817.2432341-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I was working on a different bug, and I noticed that brcmfmac tends to
crash quite spectacularly when the device gets removed before the
firmware request completes. This is because brcmfmac does quite a lot of
initialization that would be normally be done in probe() only when the
firmware is loaded. I found two general classes of bugs:

- Some of the remove paths try to clean up things that the firmware
  request callback sets up, which doesn't work too well if the firmware
  isn't loaded (patches 1 and 2).
- The firmware request callback generally assumes that the driver is
  still alive and kicking. So if it runs after the driver is removed it
  will procede to access all sorts of memory after it's been free'd.

A fairly-reliable way to trigger these bugs is to edit really_probe in
drivers/base/dd.c and replace

    IS_ENABLED(CONFIG_DEBUG_TEST_DRIVER_REMOVE)

with

    !strcmp("brcmfmac", drv->name)

Alternatively, you can use the name of the bus's driver.

I have only tested these fixes on SDIO. I would really appreciate if
someone could test this series on PCIe with the above snippet in their
kernel (preferably with KASAN).

Right now if the firmware cannot be loaded for whatever reason then the
firmware request callback will unbind the driver. This is incompatible
with canceling the firmware request and waiting for it to complete in
the driver's remove() callback. As such, I removed this behavior so the
device now sticks around even if we can't load the firmware. If this
behavior is really, truly desired then we can drop device_lock while
waiting for the firmware request to complete and attempt to recover from
the consequences.


Sean Anderson (4):
  wifi: brcmfmac: Fix canceling uninitialized datawork
  wifi: brcmfmac: Fix brcmf_pno_detach NULL-pointer deference
  firmware_loader: Return status from request_firmware_nowait_cancel
  wifi: brcmfmac: Fix firmware requests racing against SDIO removal

 drivers/base/firmware_loader/main.c           | 11 +++++---
 .../broadcom/brcm80211/brcmfmac/bcmsdh.c      |  7 ++++-
 .../broadcom/brcm80211/brcmfmac/bus.h         |  2 ++
 .../broadcom/brcm80211/brcmfmac/core.c        |  3 +--
 .../broadcom/brcm80211/brcmfmac/firmware.c    | 26 ++++++++++++++++---
 .../broadcom/brcm80211/brcmfmac/firmware.h    | 16 +++++++++++-
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 11 +++++---
 .../broadcom/brcm80211/brcmfmac/pno.c         |  2 ++
 .../broadcom/brcm80211/brcmfmac/sdio.c        |  8 +++---
 .../broadcom/brcm80211/brcmfmac/usb.c         |  6 +++--
 include/linux/firmware.h                      |  2 +-
 11 files changed, 75 insertions(+), 19 deletions(-)

---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
branch: brcmfmac_firmware_cancel

-- 
2.53.0

