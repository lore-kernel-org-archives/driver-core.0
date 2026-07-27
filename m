Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99B5374E5B
	for <driver-core@lists.linux.dev>; Mon, 27 Jul 2026 05:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131699; cv=none; b=bnKUqUQdvGP75SEQN5u4XWpm7axFCtAo16z1nfQ7PIid+UvpJgPgeXSt3ZV8HwYxIUW1UXb/spYDjKBe2P+qp78HjhM0lsDk078i7av2XG5/YMR8i+hxuUoPL77LQAWEXTvYLZOmstsMH58koylViDbzVpk/90mQs+Tv7fMg3b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131699; c=relaxed/simple;
	bh=7mKpMmX1MskxkrL/pMAAbnvDH1tmrJhnhVxH0PrYE/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOuqJiBbP+92LlAysBGq/d/ToIZhoEaHxWLpWLII+0pVa/EkXWjHRgrxGvjtjovAnIYOGuzzxq+l6wc7RvvxpKj3BCmAbaS8gX/y2MtPIyRqAjUaH12uHmjde1gwLUVc6HIL4HizQUnjVmN/ZARvBSc6EHQGXXpKSK/zF7wAM8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQIG2Vsk; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQIG2Vsk"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2042311a12.0
        for <driver-core@lists.linux.dev>; Sun, 26 Jul 2026 22:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785131698; x=1785736498; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V6QF/6cJkPvqhq4tZwqYe84qaXlIKM+84MmPz77KpoE=;
        b=oQIG2VskoPn3PyRP/+IQcbbIIejf2QGZ0GB+k0lPfAcuBgGtdnUIgzlU6m59Mk/tu+
         RRV7A0YuoffPzmVwJqfvYOmIDr/nCoBCvqggy7qAynseYy7JTeatZInWnbqzvCxX9A+2
         rq3pNjJWhMd1or+hRmSWRKIAuioLJgGrVdAQnXYMbfwV2u8b4tRDvOSL13N+5Ku3j7CM
         M1lgtXAR3IeSVn0fGR0qx2RQilT+7E+ZiIRQvskJITmY1dkYiqg3E9AZW+dcwMSkr21/
         B7ZLTRw4DQwChLRIjgW0fbn2N8ivIzecK7AE3k1ZvIG/zJUmibqxO+PSlufJG2jgDaFg
         t0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131698; x=1785736498;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6QF/6cJkPvqhq4tZwqYe84qaXlIKM+84MmPz77KpoE=;
        b=OO9xvK4glYawSv8FergF66jL3apYuq1hLtQdOHGljJ4k5AUyxVsPkM+uwA0VmGRkB0
         GrQ53+HKpzULiQFGCE5Y5/rhVTA2n5NCaIy8GFwsKKsMMAKuggPs+ipaM0CGQZ9zMk/v
         jHsp2oAJXgh6kkqGU6uSD9+NlIAY21Ssx5hj9YG+jwMs/Ohc3GcnWkQqtzIfCCERRD+7
         NkGt/qzoBZwCWN9AZdy4BX+qAkr6bncFudDc9EBwo004tVvh5p1L8MuJLs3Tpr47Xf79
         yjqisJjlFm8AoYXl7JmZXTe9WQw7apLeUWqe4aQRnDpwF2AYjz+XECG37pPB/ucAndCB
         r9NA==
X-Forwarded-Encrypted: i=1; AHgh+RovufpfE246xiW43I9aNFjmy5uYiw+PtbQ5ebZ65/KWkeYPXhz358geo6ihgXW6dEbvfE9iXVVubFHTPg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv0paa6mFfEjIjRaXsuvURU7deLVMcOeRFOvSTNA1odSB0YyQ8
	s4ng7jiLKMWPuAqQs8KI9Xo+hudphHgiIU+YcARsFrT3JFqOBHoGTkXx
X-Gm-Gg: AR+sD11g4cmNOqytu3lAySO8lhKYczl1C0omdqOxgHmge3ZnNW/c1lVMJVdEUyBObQy
	xpITRbInXuw0KSpX35yDKVv/VpyT9raiuSfAh5i3RN5GbsZGgySSpdDY6nPeavE1w+mUE9aiiKp
	rkNJx7adlndUxKjQD0XJAg2mlzRPrNOXMWuH5FkQ6I6z816T3mGef8DopSR7t5EzSqpDfxnT3iV
	3gozjrziXVpi77O7sHGQinp+gbZyMQZ3HgjosA4HOqLU3DyNzsVpyzlWbvuArqt7NmrdjOuGgeU
	WWVH0hkzqyyxz/tCp+wgu9lFAFICW3DwK2LTmER9TULinCjiy92ESq/2wXnwgps4geydSkxlXTE
	0RDjct1rrkcPfQBFSsYWujaQryOyuN9/b7duRmsr83qNhkJ6RMc7DsN4wgif3exdwbMgehbESaR
	+jcKh0S6rlSKe6OH8S36WRGdIlKsina+NROiIdejmNaTg=
X-Received: by 2002:a05:6a21:3998:b0:3c3:75c5:48d5 with SMTP id adf61e73a8af0-3c6723703f9mr9477872637.4.1785131698064;
        Sun, 26 Jul 2026 22:54:58 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:fc2f:1878:e714:ef41])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm27984046eec.16.2026.07.26.22.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:54:57 -0700 (PDT)
Date: Sun, 26 Jul 2026 22:54:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: introduce PROBE_FORCE_ASYNCHRONOUS
Message-ID: <ambyXEGt8-f44dJD@google.com>
References: <ambsuv_6mCK8U9IP@google.com>
 <2026072729-driller-leggings-e530@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026072729-driller-leggings-e530@gregkh>

On Mon, Jul 27, 2026 at 07:40:57AM +0200, Greg Kroah-Hartman wrote:
> On Sun, Jul 26, 2026 at 10:31:41PM -0700, Dmitry Torokhov wrote:
> > Add PROBE_FORCE_ASYNCHRONOUS probe type enum and update
> > driver_allows_async_probing() to allow asynchronous probing for drivers
> > marked with this type.
> > 
> > While PROBE_PREFER_ASYNCHRONOUS exists, it represents a temporary opt-in
> > preference. Subsystems that require asynchronous probing (such as slow
> > legacy buses) need a dedicated probe type to guarantee asynchronous
> > execution.
> > 
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> > 
> > I am planning to rework serio and gameport subsystems to rely on
> > asynchronous probing instead of rolling their own implementations.
> 
> What do you mean?  Why doesn't the PROBE_PREFER_ASYNCHRONOUS work for
> you for those subsystems?

It shows the intent. It is not "preference" anymore, it is a "must". If
we ever introduce switch to make probing synchronous for some reason it
should not affect drivers that must be probed asynchronously.

Thanks.

-- 
Dmitry
