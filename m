Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865F83AFD0E
	for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029467; cv=pass; b=eruCF1wuN05Qx4KbfNhfIpGRvF51xCigf0fCPh9JD68VqFgO9YTdraa/imKZaDV07jQ1/DKTsOT/3844fRJYbqnTDGIlmbmhwRhM9bK/EEHOtNEg37oaLQmcjv577tzhrjO9j+i3PwIpmpeYa7vd4rYazkBLxE5a/pl7b+866jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029467; c=relaxed/simple;
	bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtpXbqry0exQlXznEbCfb+QbKcErPTS7aOnhIPtBGFeRMKJHJ3U8pnWpEgbrtX53/dbUwxX0B0ZzvX9e6//VtS3MTkbZ2H+M3zFbzH8uqXYuJuFNpnYUk2P8nFGBxCdzkkERYXPX4PQfsjwkAxjLqcwnrRt0UeqqDbbQcOXDjLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PbunvlVP; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PbunvlVP"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482ea739de2so4602755f8f.0
        for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 01:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789029464; cv=none;
        d=google.com; s=arc-20260327;
        b=qOiqLtumDY7daUxoooVavtbVXdcKmAjPcOGCHR2jTvgI8wyzxsZoKv36KvcMzQZVT4
         uNE08kHBA9y7lP5xZ0M5NCUDiW+66/4piSAf9CRW4DGiASmVK1/NgNZjagL6PjNz1rRO
         t185WjRJunNnYYJMglPd5JPwFyTXfMeawiy1GHB1s4qexH5ChlFohvdNtkgGdllPI9uV
         9nPm3w9VVt5PHJgYECmU/rB++uMaS0qczyQou+pRZ820Ww8Ycq9/Ot1P//qgOuhHfez8
         ZNi3145jHijz8rovedpZ+AE6YVdRKXFu0f3cOGTq7M99NyyYBUBLZl+T0hhTiFMRK9ZN
         brsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
        fh=pV/W3sr0JRC3VAw6fuielYcLUvsJJG/qEuGRWgsAgHo=;
        b=OOr3PFWfFPn6mKAK5lgewC0SQjhhrHqCsPk0B4QQs5p65ls15fwIDj1mBTIdOOU2CC
         ajZJiuKX5jNS3ylne9KAVhIAJAkxmDlq38QMKqXqTx/wQkc0NGspzQJ8689Stgfy1Mns
         079s50PSmf5OQy5Ov/UDZ8c5I+Gk/Duwmx3IDsDa470iDl2OZhvCLMpoOu3BZeIIzAvm
         S7iWB+DgS2Wf8IgLaSs8mj3aNN16VNZZSJ5g8dpkdaPoIR/XoooAoVso+qdQfcfeHonb
         01PwBT5siEcbPgtDUar07DQT2RAFMUXtQTW2vSBVrD9QjSTnil9EQTKS5wk4nn5cG0zs
         kkvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789029464; x=1789634264; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
        b=PbunvlVPC1YI8lkm7tl3GKyvXiT+BA7SWSTnqNXDXP6WYSGm7m6GM+n+KCcXMilplZ
         p8fZ1gcAz5e56efphhEzNujiGYLVoDeHBi1IXTVqOQgDJFxMET7kDshvtHR6bX0o8zL0
         9AUOLhF+JR1vp7LAurFmGsYKjIQ6/9mbd+wB3ABUbn6DvXTHMLef3TYzyC3tAcOn0tU2
         2ezEctlRcyII9ROsEYr2v6sEdlPFhjrsM+2ZU7+MYO3LHuygVJOzLtzyp2qXp9tFiUHV
         nOB/7SVW2TkUSz4kF8VpGKoLN9oWz8UskZwjQeV5yKwoa3mRHtitL9GugznhwuNMwzsj
         50+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029464; x=1789634264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sc9Cfq2daynLd+xZRF9G1RrBj/E/QZge6eVGxMNfuTE=;
        b=bg8teh30Q17msnQi/JyjGnQb1G+HF+Wb3HS/kDwVGiUzf7BpeVMb6LLvybZL5SKDh3
         0UpocepM4Q8P90pJEYh9XKCT91SR7ocDmDQzA0QVEEeQMBRaFduiEKx2tOjcgCk9vjbW
         p62wiwbTjhzMtHW1zkDdj1ypEEPTyREAwRL6ZEVXB86OMWivM2e1gpRVbTO440Q1Y3cR
         zJylD2IQX0fnNELdsTqUUhkbGA1KzDkoRNl1M5OXlYGVguWl7GUWQWca/Fh705rJaF+R
         RQF6g1nsxgi3xVo41oYYRwZ3iTou+ucJb3nlsuDOn3br8biFkS5up4Ia/XLb6LLbD63/
         th9g==
X-Forwarded-Encrypted: i=1; AKwUvByCG5wwuBfhK696FibfGcDHvSf91VKn7wmSZZLu2q4qInYEFRXhrFlQydgpeAmJ3gdKLaCiFXz9xqWEww==@lists.linux.dev
X-Gm-Message-State: AFuF++kmtyiwwRU15hUkLURLSUddIFf2Zi752lilaAXeNDGBG9TxoKQ+
	crW7kAU4YDGvs1o4xRYhk3amf/0dhww143Kwe3R/1T9S/vMlKz8hFFXu0WBF9u+xCElNWzbtB+4
	QzHt903tjtWyjZzO1uhhoHMc2SY+ldsAIk8ErUWdp
X-Gm-Gg: AYBFou2uJRflqKhP2BBKTi6/Tlrt698h4kerU9k/Mr+e4fYKpY7iIFG5EBqRnlZ4DVq
	z2mUTlWHpJLp0QMYJmWhpFJWvGh4C6gqTwiCHrVUOqnHZsDBP6yhwvJ3TF6GslCLpcdAjODLsys
	3tf7RbecM0CPKd0eHo+pKiIXMuxPQxwqDJLwM6Lgn+BZHi2AEVUcJfueN3jHB5arV3/9rwiRdWE
	llB2b7Ww2gp0FSMij4joPrPTVuy2QNOAKeSdbyfZ2okgBM2WP3BxBN2bTM+PLmHGix04Ra847SX
	9vg4mWArF5D4zjB5gUFeGLEvtfD0qIzUVgGeB0+pjdpBxzz9wgGGCU4oY6fIrPYQnnZpisDWBpH
	j+cP8bApRbZ2K5OwgONrR
X-Received: by 2002:a05:6000:4a16:b0:485:8c16:a361 with SMTP id
 ffacd0b85a97d-4858c16a757mr37879090f8f.57.1789029463048; Thu, 10 Sep 2026
 01:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260826131213.1820408-1-beata.michalska@arm.com>
 <20260826131213.1820408-2-beata.michalska@arm.com> <aqEox8rYYBcfxtrN@google.com>
 <aqJqICNMitP3JTJw@arm.com>
In-Reply-To: <aqJqICNMitP3JTJw@arm.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Sep 2026 10:37:30 +0200
X-Gm-Features: AcwNN1XzpH-G7K26BQl6iCpALzC0tIsAPD3Utlt434iR5Pwrv8_DVtOsPo8QrAM
Message-ID: <CAH5fLgjWcO5fTn3fRwdt8Zh8U+AubtHfVuNOUCnm0U8HjJe61g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add runtime PM support
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:28=E2=80=AFAM Beata Michalska
<beata.michalska@arm.com> wrote:
>
> On Wed, Sep 09, 2026 at 09:37:11AM +0000, Alice Ryhl wrote:
> > On Wed, Aug 26, 2026 at 03:10:55PM +0200, Beata Michalska wrote:
> > > +/// Result type returned by runtime PM callbacks.
> > > +pub type PMCallbackResult<T> =3D Result<Option<T>, (Option<T>, Error=
)>;
> >
> > So I think my number one feedback is that it would be really nice to ge=
t
> > rid of this Option.
> Guess this can be done. And I'm assuming that's for both Options here (?)

Yeah. I'm thinking that one approach could be to use the AtomicFlag to
track whether a value is stored in the container, and possible change
the Option to ManuallyDrop. Then in drop of that type, you check the
AtomicFlag and only if it's false you drop the value. That way, you
can take the value in/out of the ManuallyDrop so that you can transfer
ownership to/from the storage.

Alice
