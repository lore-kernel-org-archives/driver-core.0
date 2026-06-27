Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4862292B4B
	for <driver-core@lists.linux.dev>; Sat, 27 Jun 2026 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782563216; cv=pass; b=TFVPH8OB/sDgUsJ9qhuHbLj+IYs9wOnCoHw4DuMUSRuOamB5oqWEPT/50Rpnv1TxFTAM1l3moJIzNhsL8Z2FhVALujLo7p/EVJ8i5ZJRf1VmZg3RQAd0ZRGYPjYasoKCaSLNJ5UCN+aezpC5TawGSwJ340zGvF+urJs7TyiOHTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782563216; c=relaxed/simple;
	bh=tiA1M5jTZ3Y/iPMgDja4ldkoTBXhRz6JYbn7HUdPCGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fouwQ/sk9UqUE6rtjvrZC9S1uUt9G/z540ddKz5YSwrBsTestyrpT7FDqa9DZ31/D1gb4QYQm3qsFssvZJEuZmfPlIlMAcyy844BUUsk2R3fiUOWZkhZDdH8pP0ziJLLQtPnGkexU/938f5fINO6xU8Ts7ldfuYaK8qId2FTG0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmpoErAV; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmpoErAV"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30cb5001e5bso38167eec.1
        for <driver-core@lists.linux.dev>; Sat, 27 Jun 2026 05:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782563214; cv=none;
        d=google.com; s=arc-20260327;
        b=KVFhSYsFeOCV8rAlhxwiG3w44SBl4HpwTLMsSw7hDbrHwBd9RBY6QatAVEiStuWj5B
         NOfg1rOJwUDXgnKdlERAZ60BNHfQw6AXp6iTUz+lz7nRDznsZ4pzKVFK8jq3xIgp+vk9
         9pVyZZyKz8/mT8ZNDyg9Eie2ONm109HlGmIraqo/AEFzTAzFBYNjnrLH44pZchQpx9FR
         ArQA2OdQRvkMOdwk6BGvXSeQ2pR1F7Hs36Wp0xZJ4XLLTiWfPzgp9ksNxZhh5it3KUPL
         NfX0HASuQ35jjmBeNFbwstiRQxQDMNm7eVguhSvYjSWEmF5wl87wz4kmI5ZAp+IxyZjU
         o1dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FFA3P0ucfKK/nr2i/TjAG0TaOdJ/VCYkxmATJyLWDko=;
        fh=/n/mjWJ8Vpc+ESLm/Ad6gmDEChHm639LF+++FemL81s=;
        b=nka8eR9V1/zjKMEMSeHcIyA9pDzhUrLHl+qvnoVH5VwiROhqet/pqIYwcgSLqiBK04
         VaIOlBdq1k8jsrhFe/W6ATgDIoFvvKBrvPKhOoNjpy/3/o9e6VuU3CaXk9RWtOCoPiPu
         hMSWSuSHQ6pOoSNTWwHbLfqe2K0DvsOdEPtxbE8JbhDFd5c67sZNy8dwc/wzCQtRdirW
         Hc8PROkkVKo64kdezMEGSHy/vnpTo8BkVCDFUlyWzh75eVa8M4Jr8JssMYUb23d1+jVo
         mfwS3O3UI7X7i2cTAU6vKASv84USqQn7Mqioh5Vds0x4PxBMc2hBSzyR8nFT16VVtLkC
         d14g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782563214; x=1783168014; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FFA3P0ucfKK/nr2i/TjAG0TaOdJ/VCYkxmATJyLWDko=;
        b=OmpoErAVNDgVDAAX3uyYV1lbVXCd4apY4NOPx1WgD5pjABjtlbOyqgAGfSrT6DcYKq
         c8V4kilFBqXNHMrk8qAPM/u+3A7fGnEfdX22TmsO/3ReQc2oo/ZtN7zDZuct9mwJr4b4
         Rhql8RgUmq8iGxNF1y3ieKgB2+t/sTJXcYMZyqrPpLd3e4w4lf1x8e9WNEPPoaxrVRRw
         52ZphLRTDFa3SWtZ3UcIFkEEZhQ2MDZ1pOFMQTKHG96ayh132iKHSH9M1c355LS1fDx9
         7tZLNZ78C4zXXbRVytIrKTgKmlsbk/Tp8sW7fBs/JhLXj1Y76H0u6lB/L2oeOJbo3gOI
         ACgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782563214; x=1783168014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFA3P0ucfKK/nr2i/TjAG0TaOdJ/VCYkxmATJyLWDko=;
        b=eN4SE1fJQTJjgRhp+CPhDDlQ+yG8WRcaNZBEoZ8LnS3JCZZUID1xc216cX+7qJAgHg
         svXsjYJ7lcIlXTwfiT1kehUimaoyUv7Mn8rcczMs7rhVvM5/F4bqDe0/fAKMC8j/yZ9i
         aVS3nEI/4hsSs4dUPFPld3XCTT2iA1p/KVC2JIYlvvniNJvzbTCkJNajLmmcACTnahpH
         K8/AWdlAF3uwMGn+yIVEl1pZ2caI7SYG74BtvUkmIwOKmE71zJ4jHnM71jYDSFj88yon
         ltrQvJde7KkME6/oJsX6fhg1GShbFWOBzo2wTrE32tfTYUJoie3XGn7l8wT9BMpEZIc4
         sZzw==
X-Forwarded-Encrypted: i=1; AHgh+RoIGfqPrxLpqTX95Ixa7E0tNCazRuRhtcsa5fHPD/5wSA5IpXkyFFA4a4VK/7VzPQ6CIDzS7HEbqFo6mg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6c/tAtpVUhnUTjt4G/4p5C6bGbmLjBfF/8zHQ9OOWXkDZ7CGb
	YyM3JeSp4G0LwxMm12Xh6cZglijV29bci2tCPxsc/EPLieZ8CNhHEbVpLwGe7RmSkSKCKfzoCMw
	2UCXlYvKaIF3nmBDtCCefhKDO8lWirEc=
X-Gm-Gg: AfdE7cnXNFVNYLgD+2XEi3ENJsSko+EJ/VFrVZKu9S/1+HWJPoXT5QidXSREZ8WRdd2
	gDT6MRV+spFmRrjTu9WRZcSLXcqWrdU+UOSBuRgCa5BI+epSH0oxV9t4pJZoMhwqVvcYLU1qhbv
	/ctKcKZ/lk8bhItE+B4ghFeZcweq/3rylADLEhatGl+XYI/it+nNapBku9bjzBFYLFedh5okslk
	myzF9rs0HYF1dYKFTgld0Bi5gPg/HvYMOkUxXVjNhgWnabTawwnGyE1LUl21avZZj85Hu67fXhd
	OtdYlfBXYpSl2h5/dcq1y5jZ/ZgX6340UuPfTrPw3XhzSXsUGErDqK48rbA4NBR8wP2Yi45UZk1
	h7Mtzmj0CfowTaUtl9tJdRs4=
X-Received: by 2002:a05:7301:608e:b0:30c:a4bb:71c9 with SMTP id
 5a478bee46e88-30ca4bb7593mr2120179eec.0.1782563213899; Sat, 27 Jun 2026
 05:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626183630.2585057-1-dakr@kernel.org> <20260626183630.2585057-3-dakr@kernel.org>
In-Reply-To: <20260626183630.2585057-3-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jun 2026 14:26:40 +0200
X-Gm-Features: AVVi8CfTJDNVo1KxD-2qMWkEFrV45PAxG53CiKejEkAqP1d75q9UdnCynZyU0Y4
Message-ID: <CANiq72=0OOgc6NtbpF0Ysdk3ytRWCGGbWg00u0Le2AzQmKGKxg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] rust: types: introduce ForLt base trait for CovariantForLt
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, acourbot@nvidia.com, ecourtney@nvidia.com, 
	m.wilczynski@samsung.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, daniel.almeida@collabora.com, bhelgaas@google.com, 
	kwilczynski@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 8:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Add a new ForLt trait as a base for CovariantForLt:
>
>   - ForLt (non-unsafe): represents a type generic over a lifetime, with
>     no covariance guarantee.
>
>   - CovariantForLt (unsafe): becomes a subtrait of ForLt that
>     additionally proves the type is covariant over its lifetime
>     parameter, providing a safe cast_ref() method.
>
> This split allows non-covariant types (e.g. types behind a Mutex) to
> implement ForLt and participate in DevresLt / registration data patterns
> that use HRTB closures for sound access, without requiring a covariance
> proof that would fail to compile.
>
> Both macros share the UnsafeForLtImpl helper type, distinguished by
> a const generic N: ForLt! emits N =3D 0 (no covariance proof),
> CovariantForLt! emits N =3D 1 (with compile-time covariance proof).
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

If this goes in at the same time as the move (as I assume), then am I
understanding it right that if someone else was using `ForLt`
(trait/macro) things would either break at compile-time (which is OK)
or, in the covariant type case with no `cast_ref()`, it would build,
but someone could in principle have relied on `ForLt` providing the
covariance guarantee in unsafe code?

Acked-by: Miguel Ojeda <ojeda@kernel.org>

We could take the chance to add some missing intra-doc links, but I
can add a good first issue.

Thanks!

Cheers,
Miguel
