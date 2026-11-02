Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618341;
	b=hcFtWkIUYeKu7dIAy71T8m97p089SgXuBPFeD5ad2JhVsrCy1g62tuFoxC6VPpjl9Faf
	 B0E0FeEMj+DjZInyPSNA6SCY2YImZ+VlH4MGpv2PiSQYINZwCYnbP2Y+us5BWdsfztr2c
	 5896zUHpXXAqp8Tso6+Q7V/VQD8C5eK4ULaTEfPrZNT2uQawKFjLlwcwT3yU3PF5OnLIA
	 4FBW0Qof2HVrVnjNYtFLXD/40+bwhfi9dgoP3gAZQI6hRmRDuXDe9GWAfo1VYhh7p6QUn
	 gBYkTNSKykcGDPPak65rwGTwH5V3CCagKHIGo0sIcFhJlv/+zDp2Xwdw8C466cwb6HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618341;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type;
	bh=vnJm24LtIoW64foUZ3HslKViWjmolC2clyIZxVS023k=;
	b=iIcQhKh0RQkL+DqfIy3oIf+exgoQ9kTeGkjqOkJJNlG4PslNVI1hCFJLrTKi9I3YnA3N
	 TJF75YJbULDOPp/Zj6wNiHY3cUcDqtA42pO9ip0OGmPyRHJtApZf57DEj4Gy2pzDjyp3m
	 tLJ+Ty7PrEMDOVXeH49dqjLoyCOcTjpg1wYftLVktpkqL6f1bKZtCPohppcdcXOYaaHtd
	 rjNayAd7bAro9YlQoIQPT4r0uYM2sZfqc75CJIKBJVJUeryHwR5w5q4Lv/gToD57mg3ZX
	 Jdn/ydxIJYloiV0fJ+op2kYzjEtN5zA2C9bKzfYGkL5kvAh+ToGwmCuatdXung5TRDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AG54iTMz;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B930606A326
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 11:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B930606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AG54iTMz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793618339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vnJm24LtIoW64foUZ3HslKViWjmolC2clyIZxVS023k=;
	b=AG54iTMzrli7mySglnJjxfY8CrLK+UzxGkEqU/ssrSTgF93sn57YMEEhprHWoNfRBtoJ+y
	TxSw935MFMlGqggjlXmdm81kDdwZrs2p1/JzLlL6pI4cQMYLAxDpISGeaxaWLqGGZyx1Hz
	I23VY7sfSUvBzYHok1AlulFSrcNRQOU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-ugd5EjgkPeOZr882mAAi1g-1; Mon, 02 Nov 2026 06:18:58 -0500
X-MC-Unique: ugd5EjgkPeOZr882mAAi1g-1
X-Mimecast-MFC-AGG-ID: ugd5EjgkPeOZr882mAAi1g_1793618337
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e0c896d05so2496206f8f.1
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 03:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618337; x=1794223137;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vnJm24LtIoW64foUZ3HslKViWjmolC2clyIZxVS023k=;
        b=q2vynX+coUGicmh3GYb3pw63EUNP2pS8EFj9JquBGwJyARzww7v47kzgD/LB3ptjDB
         oeKYLo42en6V/qXD46fIpuOVROCyfi3K5DKOyDPYSXoVLhpo+iSggCZdRXdpTT5N87vm
         ZGpbKEFjFCNNMnJue3p57FfNt8uiaTLlgrC1lOYg0IDmvGIswlyAijUwzYq/Dn6/Kzzo
         wpUMR8F2m2wrg6h50rml3wntJ1GHh8f2KtyFrZ9mR4Xt1zu1A4ZlrdRsA1MgsSfdC8aS
         olsy4hsmVMKkW98wXlYoxgmMy0quhLyYYBWi2Xfla/isc1hidw509Zq5+7nNvj8FXq4B
         sAtA==
X-Forwarded-Encrypted: i=1; AKwUvBw6pLYYtGsnzBWG6QbnMhz1L1BNo3IhP72JWY0GbjpD7O4G9ehyv8qsfYWOR4t909iez1/6U1d7swqgsQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+9jdIiXftOPez0I6pjy5EJy/US8uiMToOB9IR/G/tgomlfAj+V
	/jzp+3tBEwnUl7BrKdhyMOerbXJ6aXsT8tDwTCRl57hUKHq21Nvox7xAcDTtr2HTUW0HeMU1YSQ
	so0NqcgGRknaXLGFoqW3AQy9LS9uP3vWcyoFfmrCbQWCDd70qAlfkpYMxHNOvxARL
X-Gm-Gg: AYBFou3hMGlULnkvn5KAhaxZ1pn8t+K7VRXzi9GMJspf1w4MhC5NwZKrJBadpis12SA
	AHNjePgAp2cnzSu2aqLx92EAOqMHAX/nfx4pYuH4TP1eUE/TGrdwpQIPF7XHaRWJoYMcqiIz93O
	Mc3Qrexl9OyELmj2rMzw9z8bHWrE4X5sN1eLs8+qr40XWxsbPZaHBaJLtZQ5xccxIyw0SIljAgR
	s+aKR8QmVBV//Tsqs5TNAiJuIV/w0e7+kLbajZIoZz5RFyUp4qDY/1H1uVq45mtQkUxhbctlve0
	xWjFM68jUheV+jIia62eafRgou4P/SSK2EpDl5+ht/lF6l6RHmc5WDFRhwyHxXSO3C+rNuXwd4V
	0YMrCXj7uj7jDGV80ygC1mX6xD7R2FRJin+ZR1WVxig9ONsnsoNjAySFvAWO2KY0H+dTHzuo/Lu
	yOvzvSOa6Zinwe8UqP6fc2pjnN6hKTv7kWvg0T10U=
X-Received: by 2002:a05:6000:40c7:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e6e5016f1mr22957265f8f.25.1793618336598;
        Mon, 02 Nov 2026 03:18:56 -0800 (PST)
X-Received: by 2002:a05:6000:40c7:b0:48d:f1b3:c02e with SMTP id ffacd0b85a97d-48e6e5016f1mr22957205f8f.25.1793618335982;
        Mon, 02 Nov 2026 03:18:55 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c0b6sm18790562f8f.41.2026.11.02.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:18:55 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Dave
 Airlie <airlied@redhat.com>, Peter Robinson <pbrobinson@gmail.com>, Hans
 de Goede <johannes.goede@oss.qualcomm.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Luis Chamberlain <mcgrof@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, driver-core@lists.linux.dev, clabbe@baylibre.com
Subject: Re: [PATCH] firmware_loader: Expose requested firmware names as
 sysfs entries
In-Reply-To: <DMK7KD9A3LR1.25UWRP5SLKQDD@kernel.org>
References: <20261017142826.2668881-1-javierm@redhat.com>
 <DMK7KD9A3LR1.25UWRP5SLKQDD@kernel.org>
Date: Mon, 02 Nov 2026 12:18:53 +0100
Message-ID: <xlv1fqxjfplu.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _4pTLkDxd44gzOIgO549N5n8zeO-DYgShrI6KdwyzSE_1793618337
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

Hello Danilo,

Thanks a lot for your feedback.

> (Cc: Corentin)
>
> On Sat Oct 17, 2026 at 4:27 PM CEST, Javier Martinez Canillas wrote:
>> Most initramfs image creation tools (e.g., dracut or initramfs-tools) have
>> options to create initramfs images that are either generic or tailored to
>> a running system. For example, dracut has the --host-only option for this.
>>
>> That option allows to have a smaller initramfs image which only contains a
>> sub-set of the kernel modules, libraries, binaries and configuration data.
>>
>> One thing that can't be queried in a running system is the set of firmware
>> names that were requested by the kernel to support the different devices.
>>
>> Let's expose this information as sysfs entries to allow initramfs creation
>> tools to determine the set of firmware names that are needed by a system.
>>
>> On an AM625 BeaglePlay board, the following will be exposed through sysfs:
>>
>>   $ grep -H . /sys/class/firmware/requested*
>>   /sys/class/firmware/requested0:powervr/rogue_33.15.11.3_v1.fw
>>   /sys/class/firmware/requested1:ath3k-1.fw
>>   /sys/class/firmware/requested2:regulatory.db
>>   /sys/class/firmware/requested3:regulatory.db.p7s
>>   /sys/class/firmware/requested4:ti-connectivity/wl1271-nvs.bin
>>   /sys/class/firmware/requested5:ti-connectivity/wl18xx-conf.bin
>>   /sys/class/firmware/requested6:ti-connectivity/wl18xx-fw-4.bin
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> This was discussed before in [1]. I rejected it back then because userspace can
> already collect this information through existing interfaces.
>

Oh, I missed that patch from Corentin and I did search if anyone else proposed
something similar before...

> However, I can see how having a queryable history could simplify automated

Yeah, there is clearly a gap or otherwise we wouldn't need for example the
70devicetree-firmware [0] dracut's module to query "firmware-name" properties
from the Device Tree that was added by Hans, Dave's proposal to add FW group
MODULE_FIRMWARE_GROUP*() metadata to the Linux kernel modules' modinfo [1] or
the Fedora [2] effort to split the linux-firmware package in several RPMs.

> tooling like dracut. Has this been discussed with the dracut maintainers, and is
> there a concrete plan to use this interface?
>

I haven't discussed with the dracut developers yet. I thought it was too early,
given that I didn't know wether this approach would be acceptable or not. I do
have a dracut branch [3] though that I've used for testing purposes:

  $ lsinitrd /tmp/initramfs-hostonly.img | grep firmware | wc -l
  11

  $ lsinitrd /tmp/initramfs-nohostonly.img | grep firmware | wc -l
  61

> [1] https://lore.kernel.org/all/20260715131325.26099-1-clabbe@baylibre.com/
>

[0]: https://github.com/dracut-ng/dracut/blob/main/modules.d/70devicetree-firmware/module-setup.sh
[1]: https://lists.freedesktop.org/archives/dri-devel/2023-July/411884.html
[2]: https://fedoraproject.org/wiki/Changes/Linux_Firmware_Minimization
[3]: https://github.com/martinezjavier/dracut/tree/hostonly-firmware-support

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

