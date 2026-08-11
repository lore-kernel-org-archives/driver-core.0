Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB47438FF4
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 10:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786444791; cv=none; b=IQSgdB5UuA26yGPx2t3sUxc3iExRCeqRdWRSeG3h7/LvD08SMd3V9TunI9LeBhNIIBISLr63WVVUqK0nSoqmoCZvTEiEMiQmL5ajj+mhndXIYVuXVKJIjaFlqBUxqFKNT0AS9i7V6h93WD9k7Elq4/CAMxH4in08GLg5LusNKco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786444791; c=relaxed/simple;
	bh=pdZ35YveRo+OZTyV/eSXth05irUlOjpE1eLwF4n9bO8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pBEeVkxZMkfHOi6BI8RIdhJQVX6aftmHOhGN12y2Z/1T2qVi7IresqEer70m6lLyFPLn3OCSEkNtUhne785xMzSiF/C4gnzP3vqr3/PLZ9So2QFjKGyWU2pU+msFUPh1IvtfJXE7w+g3Wn5abjGc06nG1B/iyMF8zEGRojqdtLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HEyMPm1Y; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HEyMPm1Y"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-69e984607e7so2570810a12.2
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 03:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786444788; x=1787049588; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VGMemQkEC5pRlM4gYZJhKb5X+L3Mgf2+8jXep9XZ59M=;
        b=HEyMPm1YILfkhbp5pcWbmnlEgDlCi6bmPm76IDZUxyo41iiqzcv+pR9BiWmTfJ2+6E
         6ng23pZfK50MQFE11SB+KGDKvOonDXlowxy9Jv8JHGljo0XdzFcRBphuKEsbgZPEftgc
         KQQT21IQViGXF4seyPf5HNIrjxr0b422y8F2aQgSeQ3H2lh443X90P2OXyskUd4UxQro
         0ysfRoY4PPkM3RRoLT3CtHUGO9kFBCXgRTwzz1Smb1JQfB6f4Tw/Os/4OrBaX0MJVwQX
         bfX+7ptbf4pQsLB38785FhBA4jNQ5rd5ZH72ECAyEBL89UFhnwaXF4z7cPMb2fhG3IV9
         u8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786444788; x=1787049588;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGMemQkEC5pRlM4gYZJhKb5X+L3Mgf2+8jXep9XZ59M=;
        b=X6x0JgezTC4TYiiFIRfA3h0n7lo/zGJoNOUyUAkJtF2q/pIHFJ4kvHnWoAiciXsA33
         beEqL1sKmtwZTWbMATT0d5giCZ40pEfWm5yz/G0n1t+mORv/6ZMagg+eS9g3/Ilgryic
         lWzYT8O+BBNyotdDXIZTq91wOzRb/4AfaNkdIozI4WNoB8MD/F0Y7pgihStfVbObBiAN
         vu1yapFU/iSq/w+3gwELnsITHB9Z2e+vhzJy9pFBcERhtPXsVBWQ+kgCNBCZTTYdT5bz
         Oy+n75QZliC7WIgcsAvvBw80/b2Rvb8ckGoZgsT6lWk2gJ631S1bvZu/hITb0cz/v08N
         eDKg==
X-Forwarded-Encrypted: i=1; AHgh+RpEhTkcBeK7iHH8HY+MZevFRD0ZASO5BG2KMvqQbUYaz8ei1+Ycdtic4N0t3LbPG/oDECiLOhEpjb7Ykw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCB5HI7z62rRrIxpK+8blFTBEpuF+NIJIxhpmheB/Mb0qbIijd
	6/VlpIIrnIPBY75WXiDoyy0lS7l0J9XE3wfwbRyE2KLsBNgPC7AiUnBL1bzIz8ELaaUVJaGZj4B
	s5JoN1JcsHa2cPT6vTw==
X-Received: from edbdm24.prod.google.com ([2002:a05:6402:22d8:b0:6a3:6510:8ace])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2417:b0:6a1:ffc4:e4b9 with SMTP id 4fb4d7f45d1cf-6a3644aeb16mr1321144a12.9.1786444787939;
 Tue, 11 Aug 2026 03:39:47 -0700 (PDT)
Date: Tue, 11 Aug 2026 10:39:47 +0000
In-Reply-To: <9e189214-1274-491b-97dc-1b943c6c5cea@amd.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260810162814.1398016-1-tarunsahu@google.com>
 <20260810162814.1398016-4-tarunsahu@google.com> <9e189214-1274-491b-97dc-1b943c6c5cea@amd.com>
Message-ID: <9huzbjb9hrf0.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH 3/4] EDAC/versalnet: use put_device() on device_register() failure
From: tarunsahu@google.com
To: "Pandey, Radhey Shyam" <radheys@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geoff Levand <geoff@infradead.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, dmatlack@google.com, 
	Borislav Petkov <bp@alien8.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, djeffery@redhat.com, 
	Tony Luck <tony.luck@intel.com>, skhawaja@google.com, 
	Russell King <linux@armlinux.org.uk>, stuart.w.hayes@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-edac@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

"Pandey, Radhey Shyam" <radheys@amd.com> writes:

> On 8/10/2026 9:58 PM, Tarun Sahu wrote:
>> When device_register() fails, calling kfree(dev) directly bypasses the
>> device_release() callback (versal_edac_release) and leaks the allocated
>> driver core structures.
>> 
>> Fix this by calling put_device(dev) when device_register() returns an
>> error, ensuring proper refcount decrement and release cleanup.
>> 
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>
> Thanks for the patch. FYI, this issue is already being addressed in an
> ongoing series.
> https://lore.kernel.org/all/20260724171945.2812749-5-shubhrajyoti.datta@amd.com/
>

That is good. Should it go as saperate patch or it fits very well with
the above series. I will drop it incase of later. WDYT?

~Tarun

> -Radhey
>
>> ---
>>   drivers/edac/versalnet_edac.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/edac/versalnet_edac.c b/drivers/edac/versalnet_edac.c
>> index 97ec05d68bbb..2912b3658915 100644
>> --- a/drivers/edac/versalnet_edac.c
>> +++ b/drivers/edac/versalnet_edac.c
>> @@ -829,8 +829,10 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>>   	dev->release = versal_edac_release;
>>   
>>   	rc = device_register(dev);
>> -	if (rc)
>> +	if (rc) {
>> +		put_device(dev);
>>   		goto err_mc_free;
>> +	}
>>   
>>   	mci->pdev = dev;
>>   	mc_init(mci, dev);
>> @@ -852,9 +854,9 @@ static int init_one_mc(struct mc_priv *priv, struct platform_device *pdev, int i
>>   	device_unregister(mci->pdev);
>>   err_mc_free:
>>   	edac_mc_free(mci);
>> +	return rc;
>>   err_dev_free:
>>   	kfree(dev);
>> -
>>   	return rc;
>>   }
>>   
