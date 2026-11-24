Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516788;
	b=eS8c+7P2IIThx3eyGHXVQBUVEbrMMRClbPDYOf3aPDEXNTDanon+p41Ac0TpTh98myOq
	 x9icLqjHp4WVgUagkAxoliPdJKFCO/ufrQxNdGFVWhZqQVaU9vSe/cPTL+6Lzufvf9QTs
	 g6CITtuFhrX0jcZEg/GsaLt7eEo2A6ttrvgLJdd92jH6+ofqeOBTSYqbZk3wVqPFrcuDA
	 xrvsGnX2s7TEfPJeIVe4v6S4euFaz7A/WR0mov02424ojI9DVjc5pL+VlupicLH86Z7Po
	 TqykHIQRlAMOmPOEHkzmKiCJ4wPg3T2eY3KnKZ/EjjuoTs/dRmS2qrodwzb2J5FTQQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
	b=EJnCBu/joYWKaf1O+ApLyTbJsNnDQRWLQgqrVtTr/wsPPpqwHsTTxeJ2vWnqkmQ4n0q5
	 ZfiTRPMopV53Apou3R/oDviaXgCA6P9wFnr3oVXF1o9EfU1/5oCfq02Aotr5c4znnvsmT
	 IgnGLp1zMreNlHh4Skbl7ojPM8u7M1Neaex6tK3DL/3wzO3BmOmFrneF14AfhvsEhs+UM
	 RacZFOw2cK3KaZwN5mcxruGocU3t9Bu6CJjBcL/J6CjVIKr1m5yiuIR7xl+3weup/LylJ
	 62PxkJVpa/sqv/8IYGVKUiJuAjShV7tYiLh5feu0JOC3w8tRpGLlxsC/Pbwn1Bfu0HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UZ9+oPrS;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F692606A330
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 10:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F692606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UZ9+oPrS
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso42029545e9.3
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795516786; x=1796121586; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=UZ9+oPrSJcfNGBzobcMALgc8VsOsR6f3NOyyz7R8aeM1O5LqEUECb1sDT/sW6Dngxj
         xDrRNsswV9mun8b0Hq1X2uSD76iDs/m2kndJ9Jsd1PvRPzddD8wBPfe30Y7w658koU5V
         V7IM7TksAkt+lo/gr5mxGSGpG4eqXW/tzJ0qjGCy8gM1ekm3eL3uGgsI8FWp6sV/Rh4f
         H/rECsEvUe4+vVfIjDkyo6ywvIVgjMM1D1FrLf62Swwj3deJKMB5pkdH83K13K7nuMGT
         5UofYpQHVnmmVUCm73YzNfdHZlDiP6J/SHhfQnd3i4bJrN5Xg4zfSgLKKKJNRlEIkh1R
         JAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516786; x=1796121586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i67A04/jloiIm4Idm3ymNHqESyF+RQsVbnS4UKmnxA8=;
        b=bif3VLybvVNs2jccSsmh5XnualP10Edc1lLD75aCKdW+fB5ZvOpoGcv0RlFemjKurl
         0UQioW2JiIyZ9U+3UvHlzqOUwQSBtKlHCwM4BajJtwLDBNTQ+1aJAiE/grz52HVLQwCf
         J/xw6wteeg+4t6VSyndddfMO9vdbBDzBCo5hLgg4OBGDmTOmrGfcHupYvlwVk/emnhhB
         lDtmKSQHG9sSPqWHawp4OAeX+Qo868lJYU0oziTEEwhU0PmB60u6ZmVKbRRqWWnbN9pm
         8bGVhXizfRa/qVC3bMI1CMVDAhafP7R4c78lyzpntLn9O9BKImL7D5ZETs6sgh2nE5EZ
         /cqA==
X-Forwarded-Encrypted: i=1; AL+hErFSvXI/19dZvURaqbbC+lzbgTHUreXXVD6ZgIa7wekez7AYw3ZlbTpWsDQjL7/kNPXTfUTdmr1HQIFTLQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9uGeoketOWaxHYhm5DEhLAuAjo5rP16qE03glj+5oz3riOPmy3
	5w4fgMrYOcwj+mhH2w4dAjOv4YgfiMrApUCSIi/M9fPa7fxyKK8ckxV+GnQGVnUavkc=
X-Gm-Gg: AZFdTZdxoJLoDjxxmPmB+LDGTelxPadVakwTbES7GXaPxI0c/ebvpck9AL1x+dTwvYU
	w+IgIksP1dveUXHIY9VoxJnwQn9hMQSukPTlmQ6RMcdmJUoBqFw2q1MSng0MpS+P0HVGH6pBAyB
	7dMnF28jp/NGmh4KdtSt6G4Muv/+Ez38iYKNPQJFAGJvNp891vRCnEdel/5cCZCV+IWVFJTE/9F
	Bo7a+EmDIAh4aT0ddqBwUbf33W06i1R5psQ7lvldBL7ZHrr7tBcBO0DeOEnuoMmlwH7rGDXphyz
	esi31zXX/YEFkvghZ1JyTYQwrHGVxVwPNCHO1WEAIEMGEAlWBL2KPHe6NPW+bx0aKtK66nr7Hg/
	lUg9vx7Q8c2STPWxV/Bl1eLCC1MB9d9c0rNJXT9z/vtgUXOqdt2WybRIZ0mP0q2Pf2JGipyZTpx
	UH/CvSvB8OR+Os2OztaBj9ZBbHP63ibZ8JsOKTw34zyT3xtI6VR69v+Dw3GII0WKWnX8g6Xq7Lu
	4NuEB/bpghwLDmbf8B3s+bQn7FtcAUhcEFH0TdI7HZsb5EVrUgDXKBara6eXE5+ks+us37KIp5Q
	SJ7mv54h6z9gPQ8sgvv3Wg+qao1kuiGXCe4aPPdATDx0Ue1uKGe1EfndbMzgs2+ns5sy
X-Received: by 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr281064655e9.26.1795516786433;
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Received: from ?IPV6:2001:a61:132b:a401:6cb8:7c28:11e1:499? ([2001:a61:132b:a401:6cb8:7c28:11e1:499])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm425218335e9.5.2026.11.24.02.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:39:46 -0800 (PST)
Message-ID: <65749362-927a-492d-8bff-573c277fe456@suse.com>
Date: Tue, 24 Nov 2026 11:39:40 +0100
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/33] Bluetooth: btusb: Fix MediaTek ISO claim locking
To: Leon Romanovsky <leon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>,
 Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
 Chris Lu <chris.lu@mediatek.com>, Mans Rullgard <mans@mansr.com>,
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Andrew Morton <akpm@osdl.org>,
 Jeff Garzik <jeff@garzik.org>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Bart Van Assche <bvanassche@acm.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Dan Williams <djbw@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, iommu@lists.linux.dev,
 linux-coco@lists.linux.dev, Alexey Kardashevskiy <aik@amd.com>,
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
 Greg Kroah-Hartman <gregkh@suse.de>, linux-sound@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <20261124-device-trust-core-v4-0-037eb0d17b1f@nvidia.com>
 <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261124-device-trust-core-v4-2-037eb0d17b1f@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24.11.26 10:43, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> MediaTek ISO claims are performed from HCI setup work outside USB probe.
> Locking only the interface does not protect the claim against teardown
> of the parent device. Unconditionally waiting for the parent lock can
> deadlock with disconnect while it drains the setup work.
Hi,

your patch raises a question. Can usb_claim_interface() ever be
used safely outside probe() without this kind of locking?
If the answer to that is negative, should the locking be integrated into
usbcore?

	Regards
		Oliver
