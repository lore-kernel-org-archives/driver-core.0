Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681288;
	b=oN4oVVX+oKC4bbA8fkFlKdhqqaIu9UAJu+v/AFAoiIHTXqRuko04dB9kEjnn1Fc7t/X+
	 Omt/dyH6C30OxOs95J9DuUAaJwawcC/dPZAoylUbKBtgPHHNHDXQSUfKvllGQzQiCrexb
	 v3TjqCn1BRB2ykZ+rntLAk2l2jOuvQ5Z2Awugo4LH8ipCVD08X5wyiSjPVB54qIhMWghc
	 5kkXyYb5R4SpmBLOe75PruDHTQ8lfAPDcQ4c76dHvr93nx8f95K+jM5H+c2rRI9/sKavb
	 XIr9H2idnv4RdY1+k3u0S2hjsqrY3nk2p9DS9ibuJEI4Hnfwt4gFsvdRrfGvmXpjurw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=wBOZvbV/Ao3pnBzrcXZtW9CD2639Ae7gzM3oEey/+58=;
	b=0gOYFhizuwioHDFmX3ChmzDxfSzr2hnpZwhl+afWQ5BHIGYJ5fwVoQ3TVbjsS9aP49mn
	 L3HhSEQA+CkZyCn6QJ3+COALMr/IreVO7NLo6dXzZIu1WGifikja+nrMUAoBsbdZRAxZA
	 kE8xQyi207fL1EZIg+rJD2/brYtBzuS0bZ1YV4g12lXsqDId60tghIKTVANthy1/3uw8l
	 JJZOoKpVNtktDDdhaK1AKRk7orBXUo0043UAb7129o5govYRCZUqKHZmcXkSQp0WgOYPj
	 hqg1d2blCjJRlEqrPRwtzTfp6K0PlS7sAZdTYQQiNg7poqSylOYMR8naN0RfWzcQHow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VT5YFz80;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7921F606A691
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 08:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7921F606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VT5YFz80
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38431138772so8758277eec.1
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 00:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795681288; x=1796286088; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wBOZvbV/Ao3pnBzrcXZtW9CD2639Ae7gzM3oEey/+58=;
        b=VT5YFz80FVLcnnW0ORY4nJEdSA/8QL4UtGdVPvyCchP2Ipb+Kurqj8CDRBNcR2t0bs
         vHOXjEAjMXk85p1vluLpbGy+IlUOMLfWCe+9FvyRA2e/OiQ7sOCvCvBe/kVd+pKAEvr2
         hFMTw0oKO4UsDHu9mQzqbzMlwmNwjipgMxqUy91JLhm5Qf+vRA5EVMtpaZcVhOc3Q0ZP
         tJIHfBKMq6169+3x/9VE3V910YLgtpk6o9gzfHKfCT6q47pjjML9l0vJKPoYAm70dzth
         lYCrI15reGeacGPf9yep0oT1oovUtfIqw+ikSoQsQYppVY+ad1TXna/KU0OES2wjh80x
         0fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681288; x=1796286088;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wBOZvbV/Ao3pnBzrcXZtW9CD2639Ae7gzM3oEey/+58=;
        b=VcXD4iK4OebpUw89ROSJk2hoYaDW1uGyty+qSmdlssAg+M/xKDruq1N4eDl0KOYO6/
         ZymvAwW1oQlKhpaWWdmRrdHzC5RRSUlHEgFdpc8n7gkysL5FB54VLGFrshstw72yZsyd
         5WMs2WvCZ9VWOc+FHQvVLVQPhmSlrdWn/qw4mWwv+STaBnyRdeuZo6EZBN/n8g00Xoxn
         kWQKwH4uTE3GvtZhIugNZH+KCd9JOWlXKQHQgRWSzvnS/MIjJ8Yqanpjyzm7GFS1T+cj
         J/8w+3W/09WVayDLJlcs2k92LuznrB8bjsMzJoASMRmJQO05EigXQPXlsgrOhRbus3SG
         kZIw==
X-Forwarded-Encrypted: i=1; AL+hErFvsGVcUnvUh0upVn6Lyiotn0q4dDK/jQzXskiO1jY4GFMjqHZ5yKFJRpFr8Op+qzf1KHD/7Xpan1X9wA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/M7ntUk2rX3rQE6epKtWw0xiia5iJC4RzsHj9FROeyyKdhOJmJ
	7a51gwm29WrbyLudFZMgtZ8yfAC1ImierqDPDiMzhuD4gEsdjXcDBS1OHRyGKA==
X-Gm-Gg: AZFdTZdc7sj6OnTw0oCQYTQszpH/BiG94vGArFb/XFWoeNL9GFHCukIOCYMFl6pIXau
	FsCJ2iWeV56WnbaVxSeIe7prVjuIryy0kRldQJQznCjmOalbSEEKZEkiwMRr0Bbbe7K21ezuDdw
	WS0IL7CFXq8ySYD0YGuXTkHrX8DUzQ1P+NKmo6B7+0Pp8lJDo/2d7xlLykAV/QSOMR6ueQVoiiK
	8kVPUj9ZVhI1eGj+yuoHVloO89+shCzAFtYrBfo49uZXBe+RzAN3K1peMWlTE90qwUS43EAPWN3
	vKytOSp5vtc1e0ozlqRHO0kFX1XQAjtZGzONBUPtXIquhanmdkxy/MHnc0Ec0OI2J/odgZhZVQH
	M+intIOktuAvqRQ7j6fetti2Q42o61ebZo3yzfUHElqF/F6qbKZXgYumZcv3b9ZGZ4jByF4MS2K
	kBQc09YFIGccUEKic7E7EaWOQrrW9lzn61fizGoITo1lPcQdm1tayItwyfRNeSuiQl+ANLUPbvu
	ER6pYN1/eO0bFYxIKAuXluhv9jVhhCsYS3hmvRzJXP0NjQ9O933pi0S2bx64m3zi0stlAJ5i+CO
	6e9tn6FH1ipamv14R7x2S7RisvMi34PcizvRk3Nd6ux+qkmSQCnHlF4oSsM8A/e5uLogZQ==
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr31004036eec.21.1795681287254;
        Thu, 26 Nov 2026 00:21:27 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm68602910eec.26.2026.11.26.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:21:26 -0800 (PST)
Date: Thu, 26 Nov 2026 00:21:25 -0800
Message-ID: <8497d7101dc7524be91edbaa5a9face5@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Prasanth R <ragaprasanth@gmail.com>
Cc: linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Support Opensource <support.opensource@diasemi.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-pm@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	driver-core@lists.linux.dev
Subject: Re: [PATCH 0/3] Input: clear the wake IRQ on unbind
In-Reply-To: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
References: <20261125072124.2997511-1-prasanth.r@lineo.co.jp>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Prasanth,

On Wed, Nov 25, 2026 at 04:21:21PM +0900, Prasanth R wrote:
> These drivers set a wake IRQ with dev_pm_set_wake_irq() and never clear
> it. After unbind and bind, dev_pm_set_wake_irq() warns "wake irq already
> initialized" and returns -EEXIST.
>
> Switch them to the device-managed helpers.

Adding PM and driver core maintainers to the thread.

I wonder why clearing the wake IRQ cannot be done automatically for all
drivers on unbind, for example in device_unbind_cleanup() alongside
pm_runtime_reinit() and dev_pm_set_driver_flags().

The only case I see where a wake IRQ is attached at device registration
time rather than by a bound driver (or bus probe()) is PCI OF WAKE# in
drivers/pci/of.c:pci_configure_wake_irq(). That could be distinguished
by checking dev->driver when attaching the wake IRQ, or via an explicit
flag, so device_unbind_cleanup() only clears driver-bound wake IRQs.

Handling this in the core would save us from having to hunt down and
convert individual drivers to devm_pm_set_wake_irq() across the tree,
and would also fix buses like SPI that set up wake IRQs in probe() but
do not clear them on remove.

Thanks.

-- 
Dmitry
