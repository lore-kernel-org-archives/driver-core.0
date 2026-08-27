Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041113446CB
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 06:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810553; cv=none; b=RCogA4VDzDUxxWlcCd+C3V/yUgjKLTmGHDznOZSZJ3AmMcgPPLTNjcdkJQ7eWZSqpRXDj2zlJf6pqkRQvvW68+Fm9zTB0HWpUzEou/GMdgc8rHCOObogJiAqYHw0Imzq23hgmApwWwKmhozfiEOHvnmK1b0jt5rjwBI2KarqZak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810553; c=relaxed/simple;
	bh=xp+w1tGN2NDSldxdF9HHD7HWmgw0CbR7HVRYpzb0ewQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlvaFO07OLrEgyrZMGy9hY+QWNiF6+JfIOFqpGisonGEiHcHBoEjCbCT+Tey1Z6xpX8IdFDpgUGu6MiEy+SrryqgubMwD2DyD9wZjszO70xOySEwpaLh6Ip5xdMZ4h4r4Bu8+dY4MGLRaSvT9DH5tiajo9YogSki6e58R2W2YNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVPYIlwC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVPYIlwC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49978908b35so12258445e9.0
        for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 23:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787810550; x=1788415350; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0nNFkPNa9Bvip0LwXKQ+H6BiN5Qr8MdmRjZI2xdljI=;
        b=cVPYIlwCb3hXCxAseGMaTyCgc+Yv/gitjXIKJKGK95/rYW/Mc7HxyKzZVUkdKDugix
         D4QmICAEQeY0dDras/JjNejI+QelaL4lxvHwVQre99bSjewrX0lTXI8UYxA176xoOd5o
         sKYfb7fhRPbj/1NERQ5s+V0JO+mDhCdWVoOvpOJr5a9xKRM7fO7TszqQi+mFo2mJ+meg
         ixMIeKwzwmxyvIUzspcUWTzKpsRDD/5Ra2gwVobIcdnRJc72Wb71p47UqD0X5o/aQIf2
         37NNessbYpyY1U7mw03VbUFrmy0Wg4oGZWW1ff6reQmPpFKPycx9CUC/0UIaltzTDO2U
         gSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787810550; x=1788415350;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0nNFkPNa9Bvip0LwXKQ+H6BiN5Qr8MdmRjZI2xdljI=;
        b=gIvx9DJ2bOF4x0C0trDXUsQ75AWHprlgUw97/03MoBmmiTN5JXKUH7V59CfK91qlKP
         ybXlSnYQr1nD410N5jBP0I5SFSRd1bfOLrFAiHg2MV8DDuLTf0HQu4jyQRs9yerF2omD
         JHkdEe0qsDDdvdUYKc2tFzNTuTRh7RIRynDXWGqJ3FtOpGHFYfp1GI5/IyWH9Dw46Umd
         5d8fYcs3MLdgyb5BWCEBVp2YshSb3xnjVbVchrS6vm0n/jd6tArI7Ipd/sT5OU624aJv
         bse72rGTOaEWhlvPEls2nOtuf0EkPokSEVRylx305wc6e7JS8WA16cEKBA68Bv256Ef1
         XJvw==
X-Forwarded-Encrypted: i=1; AHgh+RrdIcL9aion6k9MVkkW4pLzE2Pe905aT0kXFanD65aRFI/x8Hafvw/wViZUP4lA7obk5tHfGalQ+snVOw==@lists.linux.dev
X-Gm-Message-State: AFuF++l8/SKKTq15fvtNLbUdgSpJjlx5lNE0AjRmeuucs+9tSPTezWbB
	4RoKDmfJxaBXKZfxf5JVO9sEXuFqX51nhNtvZRptSzya8MkZcSSA0dxC
X-Gm-Gg: AR+sD12+t9cIU7yGCdiHhBhawCLUXCdVT1vFC1QpCxbXVl7a9o5g1KXUUZZcUixvjtQ
	KY02GjnifYlcNFD1tVYDEVZ/EVPtN9to7bXWSLbrgLZ2sG0r26LUUebXe7TVgATLT0z3O88wCty
	lNTNguBN+xGPChcm3dW3+a7sbrmtjDRzt1qaTPst0LqQ5lMzU25Iyhh+TXSmW5LwmJCmcBaEq8/
	TpRFU4ebbhmTH0pnvKuvgIoumzKwvtxQI2X99iMqq7yPd9MdRKxl1sNWa0IWobmSJdPGNelYb74
	B79Pj6MaoZzgI0EXZUW+0Rt1GvKLCmJu8ohqvNhgYBY24Z+ebcRqMdqw0E8sQfEimzdMYA7NzbL
	FB4iI3yYfEKXd307vJ0vIv3RFiM0qJ98HLWbW4/2Mm0UiP9uoM1KEWfiBzhk3/7LgyH24XkoRdC
	vNfyZGE2cYKgBQfcXUcoohtNKofo7SECMAGvpUpBpavJ8TIR0hB0ndFuiWjgWi1yAScAA=
X-Received: by 2002:a05:600c:1d1d:b0:499:737c:8a8b with SMTP id 5b1f17b1804b1-499dc81eb1emr132743645e9.12.1787810549981;
        Wed, 26 Aug 2026 23:02:29 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b0d263dd5sm25955575e9.1.2026.08.26.23.02.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 23:02:29 -0700 (PDT)
Date: Thu, 27 Aug 2026 08:02:26 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>
Cc: dakr@kernel.org, driver-core@lists.linux.dev,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, rafael@kernel.org, stern@rowland.harvard.edu,
 syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <20260827080226.4ec229d3.michal.pecio@gmail.com>
In-Reply-To: <6a8efd77.50659fcc.60cd.0001.GAE@google.com>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
	<6a8efd77.50659fcc.60cd.0001.GAE@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 07:51:35 -0700, syzbot wrote:
> INFO: task syz.0.23:5988 blocked for more than 143 seconds.
>       Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz.0.23        state:D stack:27344 pid:5988  tgid:5988  ppid:5772   task_flags:0x400140 flags:0x08080002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5520 [inline]
>  __schedule+0x17d4/0x5820 kernel/sched/core.c:7270
>  __schedule_loop kernel/sched/core.c:7347 [inline]
>  schedule+0x164/0x2b0 kernel/sched/core.c:7362
>  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
>  __mutex_lock_common kernel/locking/mutex.c:726 [inline]
>  __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
>  device_lock include/linux/device.h:1104 [inline]
>  __device_driver_lock drivers/base/dd.c:1170 [inline]
>  device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
>  unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244

#syz test

--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -323,6 +323,7 @@ static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
 	unsigned int pipe;
 	char *buffer;
 
+	dev_info(&sisusb->sisusb_dev->dev, "sisusb_send_bulk_msg()\n");
 	(*bytes_written) = 0;
 
 	/* Sanity check */
@@ -378,7 +379,7 @@ static int sisusb_send_bulk_msg(struct sisusb_usb_data *sisusb, int ep, int len,
 
 			result = sisusb_bulkout_msg(sisusb, index, pipe,
 					buffer, thispass, &transferred_len,
-					async ? 0 : 5 * HZ, tflags);
+					async ? 0 : HZ / 2, tflags);
 
 			if (result == -ETIMEDOUT) {
 
