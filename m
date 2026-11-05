Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898336;
	b=Rf6PlUJNIh746fmsRYiXfaxs8LB8L7ei6tLa6ov1jDw/9+VQ4KxNQnlklW4r7V3EnUua
	 twK02zQtEgaC7hKSRMJ/rePrk3S9dRA9sRGWq5H1JXAvcHORfS5tJJG8uNCjqN0hiqkHg
	 75NFA6orXh5kT8DtIu0j+dGWed914QLQy6lIBAAYrmSOv1Fak29CIEHZgu/ClTtfL4sCi
	 WIu02QAPJYH4IYsZZG5D4a8Ad1AawhZbbPAxYsKrt5WZ/qcm0iO1o/AYXSqcrGa9Rb3jP
	 JkozJfvo+PMJZnAqVlGeqesw6GAUOqqZPmXxLI1c0Xw47KwDNH/Xt/LXKUmaiKTuBNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=t7Mrcemi56BF5iayGoRjCtdHcIwbWskinGPPufbe/aA=;
	b=xVnnIDj8xDcXigrBV1Fpj47z3fOve0kngkXn2XNk4G7+GN81UXTPzTlv4gbJni83vkvf
	 Q7yto7Qhx+uIsL4ONWraHXMxZDjZFhNtLHM2q5vqZodxE2lL8eoRbu/kwSHN0doFtPzZ3
	 O0AwF/t7oEMWbflPU5m4im+LaLQ1EWit52Rtm0QHkmR99fU3sXPMC9m4ZlMSAgC8SXM20
	 5Mo44IgH4aSscxo4aBT6nBQWvGgJalnuYXuFqijgD5SGPtpUah3o/tfEh5Uvh0AFnyBng
	 Uh3dv6AQmra1tn/TlYhtU+jDtctOHh096STHLQsf9d+WeAj7f2Cc0zNL3bKgFLA+6IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJUpeyCz;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7393606D80F
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 17:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7393606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJUpeyCz
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3516065eec.0
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 09:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898335; x=1794503135; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7Mrcemi56BF5iayGoRjCtdHcIwbWskinGPPufbe/aA=;
        b=CJUpeyCz2dTrHhddC0k0KVO8hTfwamAxOdKVTbFnwXWj4X1WoWDgPljgF7ftT/aKC8
         QEL3yn5hwAIjT5F2ucjosiQJWImJyGIxWb9A6lHN5X2D1yPJ5GZ/0LDfuN8uX0u+uaY5
         YANe0tqHT+N9AWBxCVfvCIoodyGYIGelv3iA6shct5MwXIicMFMG0OqXfkZNFz+zIgQa
         2qm+uHWlyUuG5skMmmjKwe2v43vTj/lFympZDK8ryu6ev9a72S4JVH144TAnKLKTedfr
         Gqmnrnpyw3H+opg5r3KglKA0hhoG9H+zrHDfytsuKzoHocWa+hKiiy3ZIHCNKaue4u32
         sImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898335; x=1794503135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7Mrcemi56BF5iayGoRjCtdHcIwbWskinGPPufbe/aA=;
        b=0oa+9iAZbReTxtvQScGxJQsXUiZ4dR3UkhWecBoeEq2oHEKV5b5jTnktxFDfUsx2gi
         dcwm6wOqvWkhy9ouGCLQe05/HceafOnfp9d/aCy3lxDinNkIH91nyN5i/qkqjwDY+yDP
         xgRIolku12kQd85gAgS7aKSBvkGWH1KUVJqGvoqQrgezo+Z3oT2mdpF0iT6Z2iTVwKG+
         rtQjd1aoevQ19PGRfyUKN2L7dOrbc7BBW6TWdCL2UKiyGvgC2nuwC+3zOYXcMpGWt0u7
         BcT9TN+nwxZtszuoMdIBOibPQCelGggF8R9ZhKcXNCUPzrI1yPUeWxhP9ugIEkmkfU/8
         khDA==
X-Forwarded-Encrypted: i=1; AKwUvBwtbGL4HkHeHrdH3AKgxllsO2B24EZ3ysCVd7S+oecH2h31bdFsiaLeoISnt5AoP0FHvGz60RiELKOepQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+8LPQtolEXtZJdXJwl06hhe2ecRTsuQd6BEkOaBJK6SdQC+xyf
	hUeT/XueRsqXxutcAuKJbKX3FqD2oKjwUtDn1a+BuZxDtGsaz6iS7yXc
X-Gm-Gg: AYBFou1RaZbThkqk/Ld3SChYmJpNx9fG5mmYJRusjCPYMZ67rF8R+VFC1HWzTVZVx9y
	PXZnEzPygmMapdi4353kxCfXSMBP2rCCEKlx8h10PPYx06PWxUylCGNLuEjguzMxvoyUuTNpXo0
	BuxggXiauClM0bdphtF1imDPJXhNvkr8F0tMYRm1V4w7fqX1BXSkTjn8RZC7ndcOCNn/X+YlFKk
	cMvHHlU021tsSHiuh07pk5OV/JR3cApovv3B1PNWutzviaKk497t+4bSLcuagtrJBYKit8VFoaX
	OvpDDidS9HffbaD+6BGOmzY5utgsBDBfzWxMGy63NVc7u9tSG9iuBs9mv/nx3cfJmxs/Xpm5ZzO
	7ISCER6bPCIdfu1gWsM4m/Tp3nsB4KYPgiY09Vtw/v7MK2vyDl6jFYtohyouF5PiwBciBUilvxY
	EwJEgJ45xSumYVUBKBHGVNG7Ww30KqMD59XTtRVkEjPVYXNZHV08GM7YLfE1VZWarxJH61Fc6mM
	CVQAv3/QDUhdo9pY9v0QJGNTOb+bznw6iA+s4LRdTCzOhYROBMqxC9Wy0zP9V9vdFeOISaZLqHW
	2l3F0mWjFsRNyOu01Ko8QplUw7mpxl47OKxcxhMSyYiBp6JkrKTbEYmqfwvpqDgp5XlBu/4W/ec
	H0LqaQmPwBdtHSSE=
X-Received: by 2002:a05:7300:fa0d:b0:36d:7feb:8bd3 with SMTP id 5a478bee46e88-36d7feb8e1amr5835338eec.11.1793898334471;
        Thu, 05 Nov 2026 09:05:34 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3989670sm23943795eec.25.2026.11.05.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:05:33 -0800 (PST)
Date: Thu, 5 Nov 2026 09:05:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, linux-input@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 02/17] Input: serio - attach manual drivers through the
 driver core
Message-ID: <auy2plYVi723Qt42@google.com>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-2-1e536825b4eb@nvidia.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-device-trust-core-v1-2-1e536825b4eb@nvidia.com>

On Thu, Nov 05, 2026 at 01:42:15PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Manual serio binding connects a driver before driver core can admit the
> device. A rejected binding therefore arrives after functional setup.
> 
> Keep the port ID check and use device_driver_attach() for the existing bus
> probe path. Driver core then serializes admission and handles probe failure
> before publishing the binding.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/input/serio/serio.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
> index 54dd26249b027..604440244c1ca 100644
> --- a/drivers/input/serio/serio.c
> +++ b/drivers/input/serio/serio.c
> @@ -81,28 +81,10 @@ static int serio_match_port(const struct serio_device_id *ids, struct serio *ser
>  
>  static int serio_bind_driver(struct serio *serio, struct serio_driver *drv)
>  {
> -	int error;
> -
> -	if (serio_match_port(drv->id_table, serio)) {
> -
> -		serio->dev.driver = &drv->driver;
> -		if (serio_connect_driver(serio, drv)) {
> -			serio->dev.driver = NULL;
> -			return -ENODEV;
> -		}
> +	if (!serio_match_port(drv->id_table, serio))
> +		return 0;
>  
> -		error = device_bind_driver(&serio->dev);
> -		if (error) {
> -			dev_warn(&serio->dev,
> -				 "device_bind_driver() failed for %s (%s) and %s, error: %d\n",
> -				 serio->phys, serio->name,
> -				 drv->description, error);
> -			serio_disconnect_driver(serio);
> -			serio->dev.driver = NULL;
> -			return error;
> -		}
> -	}
> -	return 0;
> +	return device_driver_attach(&drv->driver, &serio->dev);

I am not sure how safe it is, serio (and gameport) have pretty elaborate
structure and locking rules because they can recurse into themselves (to
support case of Synaptics touch-pads with pass-through PS/2 ports).

But this call is for user-initiated probing anyways, I am not sure if it
even needs "trust" handling.

... And I even thinking if we really need to keep these custom
attributes or if I can rip them out in the future ...

Thanks.

-- 
Dmitry
