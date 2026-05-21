Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE0B379C45
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357847; cv=none; b=O9rO3vPEznKMJg8FORU8gnr1jrx49vsUOOoStpBugrXGfsoc27jj2NkHmJB7iIIoxhxHnwIIkbvsRjZAqzX1wY7exLgsZvMl8gDt0PejroyBO1HTrsxVRQkTvoHw2QYJGDBFqIUHSWJ+77kBHLJMkJmV8NjL+gxetu+5KKC6BxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357847; c=relaxed/simple;
	bh=EgBZvjh1Qs/Cj4Abb16jBF7Eime7nxC5LtTa/gBSeVY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emYGT/sOQNqdLu4WGy37QRYIgukTCEJUqs2O8ggYB1y5Rqo9KvXKDs8O2k0obJKnR6fgBxvVF2lOhIWnr/sdRld9SPT+IAeWKDHQrkrdlfyA/t25Y6KM3Qme9KZZh8k1QVuwvSqEplZk4Iufjf5wJi87jB4VpGvjSw5yhv8zPes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ma1TeMYP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ma1TeMYP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso5004484f8f.0
        for <driver-core@lists.linux.dev>; Thu, 21 May 2026 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779357844; x=1779962644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTKlzlVDcAgwmo+jlp2/BdTkqc6mLAjeBwVPaOtYRRY=;
        b=Ma1TeMYPOwABWidRbOiGgDmZ/UxoNgdB0gsxuSSbCRw4ZbP6P4GLZWs6Wd0qJq7QCG
         +Rp7bgEmf2KZIhcW2BbcN6Z7ZfDS3+8O0q1rhHeksY5X51FZ0xHwUbKHnIY/6C/uRsDw
         oWVmgsyXVQ7loND3v0fgPjG4KALo9NNPQbu/qOlEE6zwb6sBl/JQA4nfspYE03sRJbhs
         tGDsMXza4lkW70keTX9FlUY36U80E7enQs/fmondndeL/XTphjtjA6mcit/2JiY2PzP8
         wiJWrigUZwjKCFSFKrsn+fslMnrCR4kuWFqmBxTubLymuDt6MDotmwPTADiF67pfIGJ+
         RQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357844; x=1779962644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wTKlzlVDcAgwmo+jlp2/BdTkqc6mLAjeBwVPaOtYRRY=;
        b=EU3m+TpYZ8FY0IupsW15LY/XrizaydU1ZQ11U3TSU7O0OhOTr46zjWHR3G5WGqkfar
         35QPws1asnrDCg4ca9T4RiWqE2vyjpR3ZBzVE1R6s4xBISYFiCuX7I2Ccm6cEyzyMsUU
         nd7Zl8TQIosI7ygvArRolHFJ1QGvEscBv88uAzwWNt4IJVH+tRf7bIc+AoSpjBCkO2o7
         CESKLMlBhZWgwHLgpdNlzTxRlABv8/e3IdMpD/S5cxcT+laSTV6oZS0NaHM5+VFRNcsB
         Bi1XMlL18VuT0IqcDiW7hX81jdydQJNhsq6iU6Y7YwNowEzP3vF6R1mvWRtNDiS5f7xA
         C+vQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gMkFBwsBUwARqGpBroRmKHIQXpgLBEUEeCE331ZsU0QxU3GqpX0O6NgHBUWc6C37pJSXYS6+VKsAGVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMblVF3QmAJHY+GtSzde3RSy+i+iApQlvTtJp4lygtDSEtxXhK
	X7Wsbu/VthNVK7LYTxbA5S9goBPktauzlDxQ0TETqdjTCt9lQdadPFcL
X-Gm-Gg: Acq92OG/3J2x55WrM9JmbZbAZCFvePFBUlwBvL8FIAVSn7JS01rzwK4jheUhV6uEUx3
	xq+E9s15BXu95RFU4EZhJ6CY80wBeGYF7rksjki81OyoFbiUsbgZJ2u/ML025vqHk3xOvGxbq5e
	Gtt7T7PtfivxEoD4Z8/84Oa77wtYd6WUTA21EGYWXph78Wq75qaX97iCkSWY3ZwUX8xrFQ8dqxP
	ZIz8F3YEGNQ24h3FBVt+F4YbhB94IeRZ29yvBPtZb/do0X9SQDu4NuM4km3zEgsHwl5PNE57vQo
	Dr8E+XPblaWbik8NGNsncaHNKVw1Coe/av4M3555T6SRbIIIFBjeLpU/56luhOT7MAVoRuAgRQy
	3/dJXL/hcYfZu4u8kdq6AFL9OFbkY83JZCnLcBbF2bHs9O//FyKUI0jfUObOsLKeKUmDWhY7/E8
	MHlKeE9lGq92VklSka5rAzAMWZi6egWxF8k136JPnJ8sqJfpugfKIITxhvZieimjNB
X-Received: by 2002:a05:6000:22c2:b0:43f:e934:50ac with SMTP id ffacd0b85a97d-45ea35aed48mr3660784f8f.7.1779357844198;
        Thu, 21 May 2026 03:04:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa93630asm1418858f8f.25.2026.05.21.03.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:04:03 -0700 (PDT)
Date: Thu, 21 May 2026 11:04:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tejun Heo <tj@kernel.org>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, NeilBrown <neil@brown.name>
Subject: Re: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
Message-ID: <20260521110402.7bc76f4e@pumpkin>
In-Reply-To: <2026052129-mustard-sepia-5cd6@gregkh>
References: <2026052000-drove-unicycle-d61b@gregkh>
	<3fb84b4c71fce994cfe1e06a5fe3970f@kernel.org>
	<2026052129-mustard-sepia-5cd6@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 May 2026 08:18:32 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Wed, May 20, 2026 at 08:19:34AM -1000, Tejun Heo wrote:
> > Hello,
> > 
> > Two nits:
> > 
> > - Buffer is atomic_write_len ?: PAGE_SIZE, so probably better to clamp
> >   to that than hardcode PAGE_SIZE.  
> 
> Where is that check at?  And sysfs_kf_seq_show() doesn't check it this
> way, should that change?

It would be better to always fix the 'show' buffer at PAGE_SIZE (or 4k).

The only place that uses is different value is the cgroup code and I
think it needs to support longer writes (100 + 6 * NR_CPUS).
I've not looked at how it handles the matching reads - I presume they exist.
If the data is binary, or it uses seq_printf() then it can just support
a longer dynamically allocated buffer.

-- David

> 
> > - pr_warn() instead of bare printk()?  
> 
> This is copying the message in sysfs_kf_seq_show() that has the same
> exact format.  I will send a follow-on patch to make both the same.
> 
> thanks,
> 
> greg k-h
> 

