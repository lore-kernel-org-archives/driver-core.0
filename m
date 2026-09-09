Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A41A4534AD
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 09:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946639; cv=none; b=ACAHTfhEWRsKBDSMikuIiqS9JkzhzIjhd5ZAThwkEHfU10oeZQx2APy9BFB1uup78wUm7IdvmCDjOV3bKEVGwasnItlj4B5vIIrUVi/wIKTQubFFpKNkiMn1TINHokSeccLezlzPWRi4ZD8ovqfMRyusQjfCr48j3kbJWyJ+wP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946639; c=relaxed/simple;
	bh=CoR+vQjBubRI4wv3EktisroBpu3v3oIwSCS6EuZEAYs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bGAH5tvJFXadYS3TwNjNd9Ljp4ymBxcsmq5bDdMgme/J8xeIAwLI5326ksuryko+0GsKW/cfdTA2OQpreEUr/Guc7iBZXAu3D6qd49JWC9+Ce/QBUGmcxNl9gZpau+i4D++UY4HsbL7H/KjvRQd8eZdt1UaAW9J/tteUExN4ch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nXrI+72x; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nXrI+72x"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49d156c917cso18503125e9.1
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 02:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788946633; x=1789551433; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CoR+vQjBubRI4wv3EktisroBpu3v3oIwSCS6EuZEAYs=;
        b=nXrI+72xh/LJ+2jiCLWhCT4vLV91nKaAQDJ5p1Jp9k++egV5McjZxctrdBl5uQTvAM
         zvb3knslChWr7GhYZHcVz1c892Ieb/3kIfdB79oyM9Mqh/OE3NBBD5nfzGmM0b6/IPJH
         u7/ftxHdja2s+SV2PkcjwtRzSdk1X9fjmfbU5N0uUJAMFoHLJC3jnMAX7Sh5LI7qgjxx
         E2BEfB30DY/3wuYnl3fqN2AqsY8FlCSyyJbn9LvVrONB31uDMKUTpm0dgxHxQMD/03fx
         MAjDl7hYtx1V8KN35pjtK2j8/jprifks3QUXnK5s2vsF9ouFgGyZSC4B0rpx8t5GmAjL
         uW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946633; x=1789551433;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CoR+vQjBubRI4wv3EktisroBpu3v3oIwSCS6EuZEAYs=;
        b=mekC45YBAWhvbW+nIeQN2EVkfwWOwfwxNMhlH2Ni9cwROXyaWlSzUDr+ist/Ds6h6P
         OBJopPm6lKMorQAlU+PayO7PJ+B7c3dEgy6Zbdkg5bVbq8oiVkQwlBhR8BwSGO1JCINL
         WLKcNofCcr7KnyA7L/YnRWsRLnoCtoNtgNUOTm/JJD7VMHXKV8AJeowfrN6SZXe7h1we
         A24OBSSrm8niJjFJCQH3Adtysru3XEUjn3MSQmsHrF8smgwxnHB++OARz3oamQRFTxj4
         wFQOUOQfjjUFtnUucjx+HFNZrd7JLWCArl6LB2Cz+zpeamE3FEXbDZ2JSzJnR4xFhg3r
         ZAxw==
X-Forwarded-Encrypted: i=1; AKwUvByOA7oI8QTF/dR4knPa5cOKh6h+mvFqtoJuKIY1fwqBEMh7PkU5LuxF+qN9sIAiI2Qnb6n/3ZA1BEJalA==@lists.linux.dev
X-Gm-Message-State: AFuF++mQ/JX6PxQrYFeHH1MJUYGuxKLcVsvJupmjjJ2XYY4mKujiqS5h
	ZwwQcw/Ss0kReeqi9uG9K367QqpjKj1I9TPohFqrwzMgMenQfXy2DfxOdETZOeJIoSrf5jzUiLW
	5P2m601kgLNk4nOjmQQ==
X-Received: from wmnu16.prod.google.com ([2002:a05:600c:4410:b0:49c:f5c2:d311])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c21:b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49d1e79368dmr64831015e9.14.1788946632676;
 Wed, 09 Sep 2026 02:37:12 -0700 (PDT)
Date: Wed, 9 Sep 2026 09:37:11 +0000
In-Reply-To: <20260826131213.1820408-2-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826131213.1820408-1-beata.michalska@arm.com> <20260826131213.1820408-2-beata.michalska@arm.com>
Message-ID: <aqEox8rYYBcfxtrN@google.com>
Subject: Re: [PATCH v3 1/3] rust: add runtime PM support
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Aug 26, 2026 at 03:10:55PM +0200, Beata Michalska wrote:
> +/// Result type returned by runtime PM callbacks.
> +pub type PMCallbackResult<T> = Result<Option<T>, (Option<T>, Error)>;

So I think my number one feedback is that it would be really nice to get
rid of this Option.

> +/// Runtime PM data stored within the `struct device_private' during

Should be ` ... ` rather than ' to render correctly in html docs.

Alice
