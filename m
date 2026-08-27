Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAA73CBE6F
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821693; cv=none; b=eOJWNx5JRPs/uk2U1IDzOuEjzi3zBsviXWXQKVr/PNtGcpdbS4CDWkNsceDFJtL5p3O7Z4UKfwlm44hfd+vlEcYEBM+VNNBEYPjdaFqwLBSjcIM7J6U0QtJ6vJjKoDBYE8VXVfsptTWaZU8fvWCiJaB5Wq0EINZ24aG0AmRcAP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821693; c=relaxed/simple;
	bh=Wn97tQUxuyvvv1tJFmLHl464HCpS2Xix17TyRvVpILE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlwmoSb28OLNTM5tkEyTA/YdKlR2yEOQ3K+/zmiAn7DEeuoX5AWtYoN4aUY4C4Ls5nQvKkLgYf1Mc8qlMRCKxOd36W7Y8los1oCcZGFvZVICWT6hSHltBMnhRSz3BjXtO75EjBIFxrH2uJtGS9oO02y0KmTJmdD8PpROiE7Kyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlmne5Tz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlmne5Tz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso9733185e9.0
        for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821688; x=1788426488; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c47rpv9RyurGDhGGYkGZTDAHfRgUQeclm5jfaqZLKqk=;
        b=mlmne5TzbBJE+OF4uYDTW6rAVru4hvrreBCexC9+xDuuL9be/3yd9YfN7brXeZL60R
         Xi6sCIqBq+dpQEtaoTWnaERgZHCFYbtbEZVfsbMcf3rkYXSa0KLidPA/zrcKQVmcib/b
         haWXQ5v8TR0sDUcatOCFFCJb3NqujHW0Sb7OfC6Ss65LNRPlZv5La17+3ohmfBOtoLTC
         VZvH8QyYnqAXmGchuv4nj5X+VRWS6W7jruvgbebvGjvr6wwZmYn0REvxV5TilyCTpDVo
         y7ThgRgZ059Jl++VtiV2OEeyCaFHBdiFrmwmxaI1Hpm/5FjRhbgipxai2c/jcIwnWW2J
         osuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821688; x=1788426488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c47rpv9RyurGDhGGYkGZTDAHfRgUQeclm5jfaqZLKqk=;
        b=AeKRwvutAVd1l9VNQZVb2zZIbhI2OmGwz0WxL6ReqOmToO4NE8u6BvcDVwmIxdg5Mu
         gNH2zfrL3Suurv7irPqWAxqiTVeT3bNCN5YBId7acKiVpsCzUZe9AqHtFw9UqpNgs/NS
         T0wz3X90Mc8glV7HePiwpWg40dbpohDXIEKzUr+Kpep3pcAxkdNR6Hbhz3m+l81P30re
         9eHAs4hnvkPFipB+hN/aqCVBNEDyBjzhBNlCC+qL4U2jSd4489dsdeKS47WCPoEIcU/n
         +5i7Vrjc52x3zuRaFHfTiZ3TnzbYlaiD23rLIvbiS8s6xUb9XN4H7YSkUTjNsdvNwGKu
         nxbA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5XkG1Mb1xH8imU45AYFvGlQ7XQdICFA581HoaNCHXJ3eEdJU6ec8jlIAYr+CUJfKgusFopQux1BBZDQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kJdLTec4rz+lvRPn35YlqBaolbBeyRFyr77ElMsR2khhnqknKc
	tHmgaWyz0/nYnauozx1SnsdxctgaNk1wdaEVswkhitD2Zal+7Ua5/JP/
X-Gm-Gg: AR+sD11UzIOZTKmYKg/pUTRQcbGkjUWNCBEX6aOwvJp0Yk3kA+UUb5NAoq4JM/QI6Qp
	2pEJNsYRT3YdRvRddFKkg43PNkEUSRip+T0NaFkgiabiYgOb4ylaq/+lLv0InKjMC+RqzbLaO0x
	ARME0AzHbuQBtOBe9f4hvBpL8lxKFzAHGJb3tiIbKMVeodVkM5EfPsLfRpVCBmcmYWB6jkPQwPX
	pOzvLNoexfaZ4XoQnOT5LgnsvrkAJysoTuEfD9T2mPiZkuATuHiOh5+nzP9FwP6EmAp/k68JFrS
	Zht55jXcfDuekHyciHMPGvsW78IVRdz0f6zgwrUNx1S/dn+evdb+F/fiIz7h4CTt4OwzaK/Oy3T
	FRqoPUvptR8GcRcGiDjs1+nlVfd2iR/2/K4apOGceGSGI7Eeas6Mejk1tK3xzmSVEb1vBX9k6Y9
	vi8rbZut9in6fxKcqwvztSaDFuLAjzouNFgPnQBTVvieQBpa111Um2Y1qYwD7p9WA4dVQ=
X-Received: by 2002:a05:600c:45c4:b0:499:8ae1:b900 with SMTP id 5b1f17b1804b1-499dc8230e3mr148761345e9.12.1787821688010;
        Thu, 27 Aug 2026 02:08:08 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49236515sm53937925e9.1.2026.08.27.02.08.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 27 Aug 2026 02:08:07 -0700 (PDT)
Date: Thu, 27 Aug 2026 11:08:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>,
 dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, rafael@kernel.org,
 syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <20260827110803.49790ae3.michal.pecio@gmail.com>
In-Reply-To: <20260827110006.66b07ea4.michal.pecio@gmail.com>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
	<2026082307-negligent-lusty-750a@gregkh>
	<20260827110006.66b07ea4.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 11:00:06 +0200, Michal Pecio wrote:
> And something is also wrong with those timeouts, because 20 times 5s
> should still be less than 143 s. I asked Syzbot to try 500ms instead,
> which ended up being over 3s in practice:
> 
> [  566.662036][ T6636] usb 4-1: sisusb_send_bulk_msg()
> [  569.717341][ T6636] usb 4-1: sisusb_send_bulk_msg()
> [  572.777761][ T6636] usb 4-1: sisusb_send_bulk_msg()
> [  575.845365][ T6636] usb 4-1: sisusb_send_bulk_msg()
> 
> Same on my system, but patch below reduces the timeout to 500ms.
> 
> I have no idea what's happening here. Looks like a bug?
> Is it known that jiffies are totally unreliable like that?

Sorry for the noise, timeouts are 500ms as inteneded but the function
tries 6 times, which makes it 3 seconds.
