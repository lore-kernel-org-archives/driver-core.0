Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E141837D
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 10:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223179; cv=none; b=PPEFY9ie5vQf7THyloJMpgTYuD/76+BH2o4w8Qs+4YWnsmCFSG3qlI5EOihMYFEwiUeGAERZDbO5wQzJAdagDY5u3SgrZt5lfw2yQa8iiqkQKIZ24tDvunAz3tuwRNT1H4i9oE9GaYXo0UfDf7WWnVg1xBlaJNobgF1lw6/kkvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223179; c=relaxed/simple;
	bh=r6+LXcRxHKFPB44ev1oBU9VmAoiQgZdaAnBuE99FIio=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gGCaF6pvxZYsA/1eM9Qg2hGNIBPXCw0jMvt99XK2C0f+7ARXiIJC1i75T2aA2Zg2jf1XleE98DeA5lVxa1+WEg8O3q7/4kSp0WbFSzYDcCWkwEjED5Tf8WzOcZvMPIJ3tGCTb25RfvceW/vs1KAqqT0Lxa2xfzFoqXGE/OzhBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WZ6i7cpE; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WZ6i7cpE"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c11f2b9f62fso156401066b.2
        for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 03:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787223176; x=1787827976; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBG80TE8O7koV0M/Wd/+svOF4P4mOtCGkWlnllaV+RA=;
        b=WZ6i7cpEFve4JZq/EWGAIOaJ/V20FrCAZOA8MB45jvDTFVtQeJCeuWgLa9IQrzhVmb
         Y56hJJriWbWZ8o0ahx2obAnjF9/6cn6ds86GBaOBOZxZrnah3TYbZBb2qpma/afFbUZY
         eMHanXsg9z7ONR5FIgepXvElHXXxDPOofaqXtECVvLPBe7PmV6j1fjIy/3Enckj7lmd5
         aLUH60JU1bP5MZGjJicz2sxXphQ+p89UIVPXmAx/8szN2WEg0T9087qfjbw73vVMry06
         d+1BPbtFSmh/OEv3S5QepBc8IS76116Un1XuzKP+s1t1D0FX4yTTMr2nc3fJqmy7WO8U
         imBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223176; x=1787827976;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBG80TE8O7koV0M/Wd/+svOF4P4mOtCGkWlnllaV+RA=;
        b=kzJ5Ft5OPKbmPljKMML75iUHNjYBl2LODeZW/xxRrCvBbpMDawdTaB57Gs52yPV4E9
         jDaWWauWZu2LbaFRvXdWXFX2o1yjBDK1r6zb0XH+S1UuMkPu9OXQBWd4nKySd4/GzYMd
         M4EgTxHysupz2OafVDDHyMCdTN6uI/U6q0QEqEWWEmCMgKUXgyoFwIUI2dwMJJgzEmBZ
         GxcOH+zIOKC74SdYGfOdwyaL6wcLV5n/uxBG7zGawOAZM0A2delD/SoLJQ9CLWkyCpMM
         Om7/qZwnjdc9JPjJ7V78dI1qqR+CPNmVt/MaqYUE61RpPYLOK+JGmTINuVtvigLzMEv2
         0EPA==
X-Forwarded-Encrypted: i=1; AHgh+RpAheN4H8zGxB4XfZ7qpLAYXh+ImBAxzpm2MWfKHW1XO8uo9aKbZj5gh9msGpmN7dLpUB12S1kOwXPxCw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yznczb1FQK+XKp8cqf/m+JBsdONzZE/x9BK6fOqAYqbfrq+Z9A8
	jmPj0Iuib5TgN0yoxpshQ90vHoRtEeKWf98iKFN3yAgiywdY0Dub6+6E5zaWU5ndPLlrdM6K5a2
	io0rUq5U7ZZbp6qpgAw==
X-Received: from ejel3.prod.google.com ([2002:a17:906:2a83:b0:c16:11e4:9d9])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:928c:b0:c16:26c7:6ba8 with SMTP id a640c23a62f3a-c23f92c3376mr791823566b.6.1787223175489;
 Thu, 20 Aug 2026 03:52:55 -0700 (PDT)
Date: Thu, 20 Aug 2026 10:52:46 +0000
In-Reply-To: <20260814220652.GA101268@bhelgaas>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814220652.GA101268@bhelgaas> :q
Message-ID: <9huzik55kqrl.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v3 2/3] firmware/edd: use kobject_put() on
 edd_device_register() failure
From: tarunsahu@google.com
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: dmatlack@google.com, Nicholas Piggin <npiggin@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sourabhjain@linux.ibm.com, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Russell King <linux@armlinux.org.uk>, radheys@amd.com, skhawaja@google.com, 
	djeffery@redhat.com, Geoff Levand <geoff@infradead.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	linux-arm-kernel@lists.infradead.org, souravsgl@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

Bjorn Helgaas <helgaas@kernel.org> writes:

> On Fri, Aug 14, 2026 at 09:00:56PM +0000, Tarun Sahu wrote:
>> As per koject_init_and_add() function kernel document, even if this
>> function returns error kobject_put must be used instead of kfree.
>
> Thanks for adding this specific pointer.  I wouldn't repost just for
> these nits, and wait at least a few days before reposting for any
> reason.  But if you do repost:
>
> s/koject_init_and_add/kobject_init_and_add/
>
> Might also add "()" after function names consistently (kobject_put and
> kfree above, edd_release below).  Also applies to the other patches.
>
> The current subject lines basically restate the C code; you might
> consider more of a focus on the problem.  I ran this through gemini
> and I think it did a decent job:
>
>   firmware: edd: Fix kobject reference leak on registration failure
>
>   Per kobject_init_and_add() kernel-doc, calling kfree() directly on
>   error bypasses reference counting and skips the kobject's release
>   callback, leaking the reference.
>
>   Use kobject_put() instead of kfree() on registration failure to fix
>   this.

Thanks Bjron for reviewing. I will take care of them.

~Tarun
>
>> When edd_device_register() fails after initializing the kobject with
>> kobject_init_and_add(), calling kfree(edev) directly bypasses the
>> kobject release callback (edd_release) and leaks the allocated kobject
>> resources.
>> 
>> Fix this by replacing direct kfree(edev) with kobject_put(&edev->kobj) on
>> registration failure.
>> 
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>  drivers/firmware/edd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/firmware/edd.c b/drivers/firmware/edd.c
>> index f980c5b56858..763e7b16d517 100644
>> --- a/drivers/firmware/edd.c
>> +++ b/drivers/firmware/edd.c
>> @@ -748,7 +748,7 @@ edd_init(void)
>>  
>>  		rc = edd_device_register(edev, i);
>>  		if (rc) {
>> -			kfree(edev);
>> +			kobject_put(&edev->kobj);
>>  			goto out;
>>  		}
>>  		edd_devices[i] = edev;
>> -- 
>> 2.55.0.691.gc56d675ccc-goog
>> 
