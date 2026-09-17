Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D908E45D182
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639239; cv=none; b=Xn5BW1Q4rJCTv7/nZu15VGUTSGrFh8lzAGVslps0TBMH/g1axPrntzn5LanSxwRAPAJd0O12uVNxYAQ2XrrqdUW5CJ/LUo3S4vu3AOLLfOjxXgUPiFn/Iy1C+AnyYn5T8xNsWbH0M4I/FglxwRiL0q1Sz/PFNndahWlFewKvyrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639239; c=relaxed/simple;
	bh=DbmJGTO38ZQmXXH83oMfgHUcchZlyuqt+YS72+gWZDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XXklhWcrNpKkdVN9LRiLZrfaJTF0HXvIQGWNbK7tP44NkzObmcOibSY3rt1v2WuDoExe6NrttPxIG7L9oy/JJD45kozs1FeSMEeFgHf8DkfoXev2FchpRTCUZ2fheHDp/9Sh+Q9WL4h7aG6ApKLpw6/lpZHMfgGZRqW+AsY2xmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGei4fEw; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGei4fEw"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so3726595e9.1
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 03:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789639225; x=1790244025; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jjyjniKVzwPmkW/8acQ86Rlei6X80JG8qnbW9s7w6qs=;
        b=nGei4fEwx6W/wyI32HM66Fu9fwvTk9bvGHmVEFHGSnB7D7lF4/QMoVFkeO5IFjhUml
         ZShJgSY392bpkAoxayh8IW4AOUmbyTKinU9eu3rAtmp7WsT5Bg8llMtJK6tdCyBw3sig
         AKQIdDUNiGcIkPm6NkTod37ZPhpOBJIp0saBgXS51Nf8hpxDMdi86iB3wUmAvRgNWr2D
         BlSyFwVRl1aV/Qv+onON1dIQpjWypJvOIDbHAoRuluMaNiSFdnTAHfJDX35MGOeAIjZ+
         a5AmxFsc1koO29xYTxS+hVFg435C6xEDJQfvnJKIo2bEwd2iV39vQfP9R9npE5iv2Amy
         IPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639225; x=1790244025;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjyjniKVzwPmkW/8acQ86Rlei6X80JG8qnbW9s7w6qs=;
        b=SIJFKFKv1dDO4drc25OtB6u4FlRVNFE269udwnq7G+EUkXPkFk0+bAfs9k7BLfRqNx
         sODl67BaLhWQloulqWW+V0GuEUAoINZA+jSzgedFveyZd8D+gF+hFcKAykwhzze5e+sW
         +3kU/ddabfhBP/WjAbw2HQEJ0gJo6N16ZD0jFDG8ElJ6COJefpAZ8mDoj5QNK4x2hmov
         LjydULr0W1UeMOU+8MCPn6B8loODQybS0LBy+WTLLgH3OK0KJVZJZBVc2oZ3PrwUSInK
         yKKgZTZqoy9dNaMad2aFTp2WA2nuqgN7vzginSotwgjdMUJ0UhZpaiQzl/7Jz15jEwOk
         j+Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxKanIDLZDMWSk/ACnRGqv7h0kLFMnYpuzO3HihaC7pvnHL8mjZd9DiED3suhbtSoNi+oRSnw2XFG10og==@lists.linux.dev
X-Gm-Message-State: AFuF++nSkBhvXZruQPIVTnH4p1TH9HzSnFYZoOCyGNypFdBMyAUIP/CV
	kjlx/ibhPshgvgfV7TdAdQCnWGiHpyXbUZFaDupDuC0c+MG8ETEY8b+J
X-Gm-Gg: AYBFou2WtP1JpkTHFogp2qwUOgaHpGs8U2vx6OvffOUTnRB0zwgEyo7WtruUTRERP59
	FrBzEj+zp8ApVcCe9wpLZGR0MQtwLWg1J6Y8FY4/wNDtsDeHET2nyZeNcn+hOuoiZB5reJQGwXR
	X2PcztlMk3cm2F3GP8NA7VYnuF6BnDArlErgsvUzcyGJJA4cndkMrNZxMS5Oi6Jws0e6xY/JfqS
	atNzaHZ0pQrQtNhl2bC7wDGEvaAkJTqBW3njfTogw3FDrQSZNe/MO5CEbzqpMohBHBlRPAOryIw
	MTMxcYolSfwReY/J7jAzKjyM9JQXua4+2jIlX37k4jsGsqcfjUmQn5w46MnDY9Cs9hfoHL26Ll9
	SluASFRaYZzvNgApE7+b6BrWsxGXoarp6wGP0Z6TiD23M5AsiOMfU1fz9fxRA9C4ea1we0yXxR+
	8ghTvniYee4T3GcNjXqVe4vVPoG88EV4hCvBnbfS0Z6taXbqS7LSewsTDJQ8eBAacLPExLMkCyU
	Xcif33UEg5W/NMgx+AYitHniiQs1/9sAsH8
X-Received: by 2002:a05:600c:8a09:20b0:49f:bc0d:2e9 with SMTP id 5b1f17b1804b1-49fbc0d032dmr85940075e9.0.1789639224488;
        Thu, 17 Sep 2026 03:00:24 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm14296463f8f.29.2026.09.17.03.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 03:00:23 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:00:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Edward Adam Davis <eadavis@sina.com>,
 syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com, dakr@kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] sysfs: prevent writing excessively large files
Message-ID: <20260917110022.06614ba3@pumpkin>
In-Reply-To: <2026091700-baritone-clapping-685d@gregkh>
References: <6aa82301.a211d2ce.1a5198.0296.GAE@google.com>
	<20260915122018.924041-1-eadavis@sina.com>
	<2026091700-baritone-clapping-685d@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 08:34:46 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Tue, Sep 15, 2026 at 08:20:17PM +0800, Edward Adam Davis wrote:
> > Since atomic_write_len is not configured for sysfs_file_kfops_rw, a large
> > file write via sysfs_kf_write() may result in an out-of-bounds read when
> > checking for the null terminator of a string element in the kobject_actions
> > array within kobject_action_type(), potentially hitting:
> > 
> > BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
> > BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> > Read of size 1 at addr ffffffff8d72559f by task syz.0.17/5917
> > Call Trace:
> >  kobject_action_type lib/kobject_uevent.c:86 [inline]
> >  kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> >  bus_uevent_store+0x3d/0x90 drivers/base/bus.c:917
> >  bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
> >  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
> >  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
> >  new_sync_write fs/read_write.c:595 [inline]
> >  vfs_write+0x6af/0x1050 fs/read_write.c:687
> > 
> > Add atomic_write_len for sysfs_file_kfops_rw and sysfs_file_kfops_wo
> > properly.
> > 
> > Fixes: f6acf8bb6a40 ("sysfs, kernfs: introduce kernfs_ops")
> > Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
> > Tested-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
> > Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> > ---
> >  fs/sysfs/file.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> > index cd5bb0f9fee6..a63130d18680 100644
> > --- a/fs/sysfs/file.c
> > +++ b/fs/sysfs/file.c
> > @@ -228,10 +228,12 @@ static const struct kernfs_ops sysfs_file_kfops_ro = {
> >  };
> >  
> >  static const struct kernfs_ops sysfs_file_kfops_wo = {
> > +	.atomic_write_len	= PAGE_SIZE,
> >  	.write		= sysfs_kf_write,
> >  };
> >  
> >  static const struct kernfs_ops sysfs_file_kfops_rw = {
> > +	.atomic_write_len	= PAGE_SIZE,
> >  	.seq_show	= sysfs_kf_seq_show,
> >  	.write		= sysfs_kf_write,
> >  };
> > -- 
> > 2.43.0
> >   
> 
> Are you sure this will not break those sysfs files that want larger page
> sizes?  Given the age of this "issue" it's really worrying to me to
> change it now...

If you allowed to leave atomic_write_len as zero then the code shouldn't
let an overlong write through (or should truncate it).
So there must be a bug somewhere else.

Do we know the length for the test that failed?

'atomic_write_len' is also badly named - probably historical.
There is no code to loop over the fragments of a long write and (IIRC) the
write offset is always zero.

There is also some (horrid) related code that can reserve a page buffer
(per node) just in case an access is made when kernel memory isn't
available.
(a flag and a single global page would suffice...)

David


> 
> thanks,
> 
> greg k-h
> 

