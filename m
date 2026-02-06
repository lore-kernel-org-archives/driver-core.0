Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656FC27E1D7
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 15:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390552; cv=none; b=HUGS6g0K/44uzu3sabSMjG+PttKcIhFJQ95P+hMsalVLlLsj22+JEm1RWxsBo/st/0lhwiOHUwJoDYNocbwZJWVRZj9FddE2gvgAc6xZuFFB/1G95tASLLGzLkP9UnqVgP3oDMGHO30ugMCkEWMppGxI8A7GxtmZ0p9OIJEIcNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390552; c=relaxed/simple;
	bh=sePmmgijUQGCxRJ8YWd0pLqDOUOLq1jd5KdGiyMAHNY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I+geTj5TQiYeCgG0braIcYiNJoYRBL30RR2oYCZcd0iQAT6iOU72wb4AWU6IpCnYl0Q1rKfFje7bLutsIBiUtFs0FW+NBtyt8xwKvRijj43+GV2pQfw54fRhSucUhCFxI5QDTLb4rIbS/CfvBiG4TRj3uQ8F5JWVzWOhi2YSz3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=31SVm7oy; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="31SVm7oy"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4806865a01bso20250805e9.0
        for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 07:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770390551; x=1770995351; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8anP+U2cWYN4xpLiUspPGH/QeZSFPYAkk4xHbjSWBvQ=;
        b=31SVm7oyY9ez5rmg2gO1P6vJqVvRWPEMlrptH+lIxzOqs8crM1rNYUaL+65znp7OTz
         47JHG+zRTtvlSEKyrF+cUTD//hWxei8oXfyFBNM6Ig0ipSsTGDNwo6ZsKzdMOpzRgiA9
         UkG03Ta+FwcPmoRlLT1ODtffmTZP1fXjlgjLEEQjjHk1kOiBcy6GJOMSjcYM66n5Stcl
         1t8N/mfQvFITGyVYDRE8brlZe+UDSaU5it9P37029FQ53FhTIUbFyhM2Xx1k3zIHJet4
         FoKrTq3Yui5gycCopCb/GWRJ/0yK/FH/Y7Pvx4iuktLl4qG2Itm7zmVZYQk6Ua/SbQyi
         KRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390551; x=1770995351;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8anP+U2cWYN4xpLiUspPGH/QeZSFPYAkk4xHbjSWBvQ=;
        b=t25h/kSZjWPap70TEf3zoETCn4AWyPK6ht3wjGf92DJL1cPyiCxWnjN4nTvpaOpW0d
         u/g6OuZOciUXp3BYKxPouPDsU3RyL5pxIywJz5DOslDL6+4BKmS55fO4lOlyAL/x8TXe
         KaigIEszE9fCIAAZgfohrFzwOSdUvypgFnsBnRPg39rb7387AyoU2aqI+P8e/PMPf1zT
         lj/qgoCjSLUcsrs3wbR+obxAoxldpJZWN4G4DGz6OU5euVfQcLHr3CusYDtWAqy4jZh7
         BiaNOSQmHHN8DDJjhsCu/BNfFs+8UFqdABXFy/EuxeTY7G+uNTmoZNulN57L+JqtWWNT
         FYfw==
X-Forwarded-Encrypted: i=1; AJvYcCVeIRGSUFq+5yNmY9W+AwOBMWMt/r7A228uJYmhfMCCSTvx8fM7Q0yaDjqo1GUPQszlIUu1/tFEP93L9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCGT0qFHoozRPQKoKFLFSbgupa5W9Ko3654A7o5hZsKOt/eCtF
	XsK9H4XiVl+Va4hVNcWiFKPAXSz25opj6jcpUy/iGejU1E06yNcWEmSsNKdtAUJ5rMfLp8sTErC
	4w41EsIzmh9OkaWGb7Q==
X-Received: from wmj4.prod.google.com ([2002:a05:600c:244:b0:480:6b05:6b9a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8116:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-483209b06d8mr38753915e9.30.1770390550899;
 Fri, 06 Feb 2026 07:09:10 -0800 (PST)
Date: Fri, 6 Feb 2026 15:09:09 +0000
In-Reply-To: <2026020633-foe-etching-e464@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260205224706.91996-4-dakr@kernel.org> <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org>
 <2026020633-democrat-moisten-631a@gregkh> <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org>
 <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh> <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
 <2026020616-hardhat-french-4dac@gregkh> <aYXtwXYAELSIoxXE@google.com> <2026020633-foe-etching-e464@gregkh>
Message-ID: <aYYEFRwotF5AL_Ch@google.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
From: Alice Ryhl <aliceryhl@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 02:55:50PM +0100, Greg KH wrote:
> On Fri, Feb 06, 2026 at 01:33:53PM +0000, Alice Ryhl wrote:
> > On Fri, Feb 06, 2026 at 02:22:42PM +0100, Greg KH wrote:
> > > On Fri, Feb 06, 2026 at 02:16:05PM +0100, Danilo Krummrich wrote:
> > > > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at all.
> > > > Hence, we could do something like in [1] instead. I don't know if there are
> > > > other options that may be better though.
> > > > 
> > > > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/
> > > 
> > > That's a start, but still messy.  There's no compiler options to prevent
> > > this "lifting" of the code out of devres.rs?  If not, this is not going
> > > to be the only problem that drivers run into like this in the future.
> > 
> > Because of how monomorphisation, as-is the code actually lives in the
> > module to begin with.
> 
> Ok, but again, that is going to cause all sorts of "the symbol is
> undefined" type of problems going forward as a developers just "assumes"
> that the place where the symbol is exported will actually have the
> symbol exported from it, not that this place will be copied inline into
> somewhere else.
> 
> Think about the interaction between module symbol namespaces here.  This
> isn't going to scale, and will trip people up and cause us to be forced
> to export way more than we really want to (like this patch series shows,
> I don't want to export any of these...)

Hmm. I don't know how to reconcile namespaces operating on symbols with
monomorphisation.

We should probably think about what to do about ... :)

Alice
