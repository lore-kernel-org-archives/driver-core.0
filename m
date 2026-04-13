Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A061320ED
	for <driver-core@lists.linux.dev>; Mon, 13 Apr 2026 03:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776052588; cv=none; b=cSJz6hQVaHbefYkyKjAZa/dpRECY8gkZ0/XAVhhPxPpIr8k/kcDLQybgDdGRot7U7HiTQFUqWCbGNweb0LFGEhqG1XempZpd2D6AxSG2VMcibGvDX0iXFNFzafFMHZZnS83Hqtbp/VaUNAjEAzI2VSPwNJxZqcmsQofVfR8Rbn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776052588; c=relaxed/simple;
	bh=Ye6ecSjodBIYRJObejboSvgaGjpMkTghp2ypcRpo6PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epms3cKtZ8izj6QbNx2yuxZa3FbazWR9tEzj4JiXYIPri15Sj6vHc8pQhOe361WgUdTammzBPoqT+JfKVD2zyB/ZhGGLF5cYsNfLJpV3jRr80c0l722Ipob2qeNJjlGK9J95HOoic3myVOMZGzuKMublxhRlSDvvxsdInAqQWls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYgnjMd9; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYgnjMd9"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c156c4a9efso5391607eec.1
        for <driver-core@lists.linux.dev>; Sun, 12 Apr 2026 20:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776052587; x=1776657387; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eLmrx+20TRfegMk1Fsd9XgfQ6YvAqFhX5JtllbLwzLE=;
        b=fYgnjMd9ioO5Sak2FM+dsT7w4NGD3z1qmWgiDrmI+weDBCM1xZrRUF9eanssXVjGf8
         Pr2aagrvWWC8y4fWh/hvWINZV3ViFDTpzEngTfzZdX1qszG/AexQ59/gzwr6Z/+XGmgx
         cZb3Cf0yfPKtyNa6hbtY1+A344u4c+pjgbB7Y66RACRKzXxteRcNs9rsbatwukJPA5f1
         kr4+T1gfvIjjCY1nCjttipDjA6kS+kdZiKkMdgAvqRTe1Kp0SlVWsV1iaWcLocdcSLD7
         f6K/6qUJc60Iw1o+2iP3+SInJqvsvC7EP4kN7hbHhr4njVR6ulWmO3TYtY6N5ziZ1SX+
         xfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776052587; x=1776657387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLmrx+20TRfegMk1Fsd9XgfQ6YvAqFhX5JtllbLwzLE=;
        b=ofC778EpKYVKL8k+NrQumhLgkkc9kwYk+KHO34MJes8pY6Wws61o+GcTlkZuFHifXB
         1l4KMBM0eH39iiK1eJReJgMExcBkPeUTHzeeSUPmnIRdR9hKNW3/f8QM+rnET9dm8fNp
         /T3V3mZeaI9hKt5WcFlS0y7EWEL9XBtGzWE8/rEiQ/NBgZ23pp+93skxqq8R635aDiRE
         gQbjoMuh9MVQmLGlx4oqbF8kmwm6ZrGY8OH5eCVy365ef38vFkorJ9h4/rnYbqXsoVkB
         n861Ykd3jUeYSe05SgB3P5QJL1pgxLa2OBQFuUgFXmV2FWaBrWnvjkJM45WPRU8gU3hx
         3tbg==
X-Forwarded-Encrypted: i=1; AFNElJ8uuUQONCfDc3ZrP+k+xgq2UXVYLS/LKGHpVpptLk/0StOKhKcEN7LmHSK5HDBpa8BwIsEjM0l6FthEng==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKUV06ZSJIRtCHV6cMJwmEX50fN0ruIMLP+HNq36JsVQxvOhcE
	XufzE2ADsIzIJ8NRWtE3DI+t6uAL/biNhqvAKkvgTsibgtSSv7mcNvjD
X-Gm-Gg: AeBDiesYN/sR6N6oZu4nfLyg9CeX3njOigRCFzWcroXww+caqhT+L5tTb+59YwkmhWR
	42Y2RuWgru9xKzjWyTrHEjJfDsgT0sGzztmkx0H3P3dVwxnmIEM+7thk4dUDwWjss846dZ9ToR6
	eU2vWVstKlF6rvcHDht3LpzXhyACzOymuL00+lqY2AHggRS5Z4kWHG74ndScjLeiuOfmI8pjCOw
	i4TBj2dtKO0SXOeqvg1VkYbzZLXRpeT58/dtZqgxLmMkPn8SO1lLSvKYZ5YFXW+S/+TFzt6nt6V
	h1P8JTGNuSqH2zxbnO8lsoC3d6/GJisSnBntMu0fzR3MNeR8zZKbRc9qqCfn8xXb4OmPELP9mLh
	L0lMINt8TH+tio4bsN2dOLBOCw3TGooVAnP8htcIqFm2p0/Y/UZ9a99/7GGrtdYYj7Aq4+u5Yzh
	D2OTuJWSYoLGW324mC8n0lPcWQc/ZnGxCeZW1VnAZLxWi5ael2kv/Gvpnv2xV3QSPZ
X-Received: by 2002:a05:7300:b913:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-2d96373b29dmr984465eec.26.1776052586717;
        Sun, 12 Apr 2026 20:56:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:fd17:4617:989a:1816])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa586bsm17303919eec.11.2026.04.12.20.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 20:56:24 -0700 (PDT)
Date: Sun, 12 Apr 2026 20:56:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: platform: remove software node on
 release()
Message-ID: <adxmFlfIcoZ19Nm9@google.com>
References: <20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com>
 <20260410-swnode-remove-on-dev-unreg-v1-1-cd7d305f3db2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410-swnode-remove-on-dev-unreg-v1-1-cd7d305f3db2@oss.qualcomm.com>

Hi Bartosz,

On Fri, Apr 10, 2026 at 01:50:45PM +0200, Bartosz Golaszewski wrote:
> If we pass a software node to a newly created device using struct
> platform_device_info, it will not be removed when the device is
> released. This may happen when a module creating the device is removed
> or on failure in platform_device_add().
> 
> When we try to reuse that software node in a subsequent call to
> platform_device_register_full(), it will fails with -EBUSY. Add the
> missing call to device_remove_software_node() in release path.

Thank you for spotting this, but I do not believe the patch is correct
as it stands. We need to differentiate between nodes registered by
platform devices vs nodes that already registered where we simply use
them.

I think we need to mark nodes that platform_device_register_full()
registers form swnodes as "managed = true" so that they are cleaned up
properly.

See also sashiko feedback.

https://sashiko.dev/#/patchset/20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2%40oss.qualcomm.com

Thanks.

-- 
Dmitry
