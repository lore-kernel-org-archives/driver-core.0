Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078EF40DB40
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821216; cv=none; b=Xm7UIPAfncXZMlo4j81xuK/sFGmOwArQ/O5oxnbaFUgA0pvWgo79vNGKpGQt8WEeKsws5jiLLJnCKcWR0gnh0TH8A2tp0IZD/XiNXU81Top/0dmZwkfEtpCjHA1RzQd0E4KlfNVhUGT9sz3OXMPO9R+3mmPzVYja8PdQIZCv8G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821216; c=relaxed/simple;
	bh=ULL0WSE+VnO9meH9P9SHFZ/5ECm8VRmPNFjsu7sTbZw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hKib7J3x1R4Q264j5VWFCuttqf1A9+BnvWVCstikG5iS7BZEsjmjkSLb7TQFLWa/4xOxK4dQt8QcqXK2q2SwZQDNfUkNqsXkP5dVV8zdNRd0F3tx+DpxFKRH6MvBuh1W9r85lbCy4hhDfhJg3k3UHjdvlSzZEZei6M9SRqcaYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4D2aksV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4D2aksV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso16797445e9.1
        for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 02:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821211; x=1788426011; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cm05Jqi50ugmia6yOpX5uH7qKzSDAmXg4hbuH3KqhN8=;
        b=Y4D2aksVooS5f6coN5YxaAlIGEe/3F8jpdE2yS06Fw5X0lrzonYg2PpjVyw9wzY4Va
         anCVWOHqxArEpW+9/D1iN5BzRndPqKwIZ9DIE5a4rzeftTKpGf5QbGoHShQ3NYOt2sYe
         VT/RX4RQnfHiHZJN0C9P6pJ8pNf8UD83pUXN6mnyHqlr6UNAXzX/DFvFFTn3U75Q55n6
         TcZw9fVDHADeF4/28hgGrWcIdqbVQPGrwlTj1r7OGKsWWhXpEc+JPVDNlm4r4LZIBfY4
         ldMOW169pQx4yoLoluaK0KCwYl6JUyHnzdddVCPRmWsLgpJEOCo4Ofbu51QyfmnD3boz
         prUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821211; x=1788426011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cm05Jqi50ugmia6yOpX5uH7qKzSDAmXg4hbuH3KqhN8=;
        b=JhQX0zuEvNKVAmnZRcBHoTnDtpH9d9HJzrDLHWv6PkmfcBIFAE6h24m1IA0i8L/T1p
         Mc9LwGrrWYrP7Qpq0bd6AOdeqh8kqT+97/JT5ixdULOrmktfpBq/FnOMOFdELT1ukPM2
         H4JgTp6CJ6z565FW1xLYO638gVBMJqh3uoeb1lhch6dg5sJUaK6VEapZmKFXFM6jSTam
         WZIZOed6ra3oSNC+W+kX9x7eSQHPh34FVKu4Y33AzAWRziI62HfXyHxA3gM8pV6ZAX1C
         vlxib7mSIc7vp5zj865UUKyNXLtR7sURULWvrlxhBtivtzy4McKj3thHMrTPrs3mIpci
         tnzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJ7SEQ/N0pX7XalqRZyBzzFXVJjsairJwN3KHMp7wRYUiU8cTzi5WG79kajNa7fXFPvfwTWPGKb/kg2w==@lists.linux.dev
X-Gm-Message-State: AFuF++lyV8x2OCc8XlBSvdVqiCJf3Enasy9NHoiMe+AHtCb99tGDNycs
	RvxAaVohjOCuCZZKs8ORm14Vg4nCegSHHvt6WzBeVFI5BBn/lcgzMlfA
X-Gm-Gg: AR+sD133FalrTfms1xiz+xRJl5xabgO0QUgUHS7ob+ffvhPz1CNvtP9gxKg7H4Qt5OR
	T136q1BLohyKB8EYSXRmHnaMuulVlHKTdW8y1+/7TiA81OjbBO3LtnJcXnDjTlaJekC5OrjT118
	D1MZ1s655RfdZIg6/9TN8sAKbfvWfD0fAivJyCHgE1Q1RRPGoWAcmzp+X6jhvk3JT66It+W1PNk
	OeFMai12iQ5XcO5Ivhh+MfxIosPGK0Cbl3SvQq7k++8ESR2rIy1YXWMPOchzCRoUxTDj9kdsgG1
	76BF4NuakYqBMaRGg7hw1V61q4NZcBGsOViDnFZzb0e9b/Nj1Uv9UFgy/7K1FdBGK3LzoTUKCAz
	upO+Iu2YYIMz7cXL1ud1o4VIBS6dXOOrHu5Ga0NeeHvQF103J1kr00MWmicNoxsVkIig9clBfxX
	0KipOXP88GX0pss+l4MEcF1uWkdyvOqfugUBoDD9Kqd9XGe31jZeiNaLH55dJh2sGAp1c=
X-Received: by 2002:a05:600c:3b0c:b0:499:b01e:911c with SMTP id 5b1f17b1804b1-499dc6ea9f4mr154197375e9.2.1787821210834;
        Thu, 27 Aug 2026 02:00:10 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56dfb8sm51305175e9.3.2026.08.27.02.00.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 27 Aug 2026 02:00:10 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:00:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>,
 dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, rafael@kernel.org,
 syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <20260827110006.66b07ea4.michal.pecio@gmail.com>
In-Reply-To: <2026082307-negligent-lusty-750a@gregkh>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
	<2026082307-negligent-lusty-750a@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 23 Aug 2026 13:46:43 +0200, Greg KH wrote:
> On Sun, Aug 23, 2026 at 04:40:33AM -0700, syzbot wrote:
> > INFO: task syz.4.23:6285 blocked for more than 143 seconds.
> >       Not tainted syzkaller #0
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > task:syz.4.23        state:D stack:27592 pid:6285  tgid:6285  ppid:6213   task_flags:0x400140 flags:0x00080002
> > Call Trace:
> >  <TASK>
> >  context_switch kernel/sched/core.c:5510 [inline]
> >  __schedule+0x17d4/0x5630 kernel/sched/core.c:7239
> >  __schedule_loop kernel/sched/core.c:7316 [inline]
> >  schedule+0x164/0x2b0 kernel/sched/core.c:7331
> >  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7388
> >  __mutex_lock_common kernel/locking/mutex.c:726 [inline]
> >  __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
> >  device_lock include/linux/device.h:1104 [inline]
> >  __device_driver_lock drivers/base/dd.c:1170 [inline]
> >  device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
> >  unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244  
> 
> Ok, I'm going to add a new TAINT flag for when unbind is written to as
> that is obviously not a normal operation and is only for debugging
> things by kernel developers.  Adding loads of work-arounds in the kernel
> for this not-real-workload-path is just not required.
> 
> If syzbot could stop hitting this path, that would be great, as it's a
> root-only thing for debugging and not something "real".

The root cause is probe() call of one USB driver (sisusbvga) taking
an eternity to complete on nonresponsive hardware, which is actually
a pretty real and not so uncommon annoying behavior.

And something is also wrong with those timeouts, because 20 times 5s
should still be less than 143 s. I asked Syzbot to try 500ms instead,
which ended up being over 3s in practice:

[  566.662036][ T6636] usb 4-1: sisusb_send_bulk_msg()
[  569.717341][ T6636] usb 4-1: sisusb_send_bulk_msg()
[  572.777761][ T6636] usb 4-1: sisusb_send_bulk_msg()
[  575.845365][ T6636] usb 4-1: sisusb_send_bulk_msg()

Same on my system, but patch below reduces the timeout to 500ms.

I have no idea what's happening here. Looks like a bug?
Is it known that jiffies are totally unreliable like that?

Regards,
Michal

--- a/drivers/usb/misc/sisusbvga/sisusbvga.c
+++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
@@ -225,9 +225,13 @@ static int sisusb_bulkout_msg(struct sisusb_usb_data *sisusb, int index,
 
 	/* If OK, and if timeout > 0, wait for completion */
 	if ((retval == 0) && timeout) {
+		u64 time = ktime_get_ns();
+
 		wait_event_timeout(sisusb->wait_q,
 				(!(sisusb->urbstatus[index] & SU_URB_BUSY)),
 				timeout);
+		dev_info(&sisusb->sisusb_dev->dev, "sisusb_bulkout_msg() waited %lld\n", ktime_get_ns() - time);
+
 		if (sisusb->urbstatus[index] & SU_URB_BUSY) {
 			/* URB timed out... kill it and report error */
 			usb_kill_urb(urb);
