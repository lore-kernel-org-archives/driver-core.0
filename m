Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A3E3FDBFC
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 18:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779819721; cv=pass; b=cJIUnlJOOKpB5InM5+N7xroyYGK5pof6nIX7spjDLnNxuR82a26QYYa4Xc8gSGZ85lntArhVWBrx3qd9arJ1EobZAI9+SdleThP/Kwxj8HR28ElXml5UfzCZSxSRNbhFLfZOJok2KBt+BdcU0V42tJ3/QOv+foIlYmIa2sjTbZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779819721; c=relaxed/simple;
	bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qporlGSYJzSLteor+sYRYpO689miOV3ekCckOHHhOy5JSLlGJj0zkSQvBm+SavlGCtL6h2lpW/RqbXEGd0FwsJbbd5i987zn8d9rL0XWtsoEZrZEmboYqE8dRKQ3fKjopg41hMPIZrGyCJEWfS+7HZLtoVTo++n3IHPKzG+TyEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWerNJLQ; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWerNJLQ"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ee4e75bc93so937954eec.1
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 11:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779819719; cv=none;
        d=google.com; s=arc-20240605;
        b=lkMN38hCXciYe7cY7adZdVvoVJESXfHnUwy7r1jd7GJnfcpK02opOkEMNWVGg7ZZDf
         lVVeurPzVUscEokUEc/+ggU1NOyeX9xkgr120HX7N+yczVjYAV9O07AsA5ioyIhw8l7x
         tdLScfqKFM3t/5e+uAJLy4mmPe4wM5iYp9XH6BBtl+OKcN8KuxV2Xmmc39YlymSZcZoN
         5FLk7f3OB7ucZQsxoZi0+NTJeEeCJW50+kFc2RP5j6+kckt6p2+tXzw7p825LCzN/aHL
         n66OF/+cGha3v8YW6kBrq2mOFQF1TmdnmMrF0XJgdAUK9SDsdbJsjMQYg/MPpPKi2S+2
         2g+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
        fh=xjSkBOZQL2kHhK+EsbwTf5PBlD+CHXWAIscrKiSb5n8=;
        b=YIpZiNH8MGm8ZoY2bfTnncLbdOOxqiof7Mm8+yXgk24Y/oLEnWpL9A8nt5nJCYEKz/
         Ro8S4cS5iK7y/t+xN4dz4el28KCKHaw6ucuozN0ybVNH42b+P8FNYsoiWnMVoxRBPHIr
         CgF0NXWxKf+ANW67gCaA0kgZx3TuDpCVaBpwSx3ur7mNw/XAGi6DtmStB215kgyXfLXH
         Gq0S5f0q88mePJI8vjqSneuQVYoiQ0B0xqPT9Ih8Vu1InTpdmxxaqyjbNjIyPmZ6NHug
         9FlKSzCWzRAz5FgSEAcyAVtXYsxsLnjkviIk6IQXK4FMqiv5+ricDTMQxOnTCIuWdPs+
         QBEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779819719; x=1780424519; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
        b=SWerNJLQMBpd41OAIp1M177NMUq5yYX1RSw9CmvEJKDGXPRKwpwCDyxmUNLR2WQLK2
         3AGJQoVFXDqzCmYkYxGdagAaTGZYiTAZo7JSNBk11WfFLqjWStLrqMJdVBuIHAYJH+QS
         UOZbN3pbfalYYez0tKRd1NY98a2EoWvm/IHssgcjTrQr6g1t1ZKjS6bnHJJ0OS1ocBJ/
         VYCY6KjV/hwJ7v3VnFrR7wDdbRP1Z6T4eR/scSXjIFQ9kveSW1hnk40zj2NA7QDBgjRu
         u0yZflciBK9MiNlF6y8ouoSIezf/wGhj3V/TJRde4OuDKvAR4pGZiQJJlAkwvVLNNRJk
         /MWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779819719; x=1780424519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zZlGXRWOTNjKRRnkKz6c2KolMrR/moiIJiI92PNpY/U=;
        b=nvTJ1r1yY9nxyunRMW8e1Z3vEXd1ZJTFBgE0niGEHALEERNvsy/dv+gFK6t+LhbUuQ
         BAsKUV/v/QRwwHJyD2IcL753349jKeggWvlcyuOJSZr9Y+JsjrU1nklL8n0mLH51ptJ5
         n7ZGmM2GgTP/sFvpKA6OVmxO31TRohWxCCw2oXfkQCIMYXUGgXtcpnjtYjZzWOQayC9N
         JDlPhA2XKBMVkRFeMS30rCD6c8e6QBLVbv+uoXxe3dOnVM9e86fDjVmgw3mce+NiZd9J
         kQlHs7YFez6qkr2Q6NbWKE/5ieFr2mYh4/3t1Ls9GUon5qUOEKzvIR4ajq5Gj4f8tAQh
         jJlg==
X-Forwarded-Encrypted: i=1; AFNElJ/DcfGLp21CKp2M7yVPm4Q+T3RsG33YK+JnfBVn79H2jF0X3BvPRAxo0B8Axk4x3/OLFJ43dvDCLttrIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6NedUzbeaprmGiXwFwGREuBcdfNwJtsBzaE2Q+TH411MFXhOO
	4ZIa7VsybKo5aM+5tgD4JNV06BCplmgdc4TUV8Tjhb9oaGCxmQIPkuCNzfsALJPTOuz0Uc2Bsq2
	hd0a1lGMwkf4H1BwJiXj3trRaurF6pR0=
X-Gm-Gg: Acq92OGZIjAgIcrTX6nfXHs17Izt+cx4YjV+2n2EvWPNk0xCOcuwr8jw9dy0FTEOkQF
	Ql5/pEPvePtw0ny3Nyq1JB6A76h4kMgXe1TFNQJkmgfMM3+Xu1Kt2L2bDIDHMVw3xkpIZxAn9Pt
	57AerASl0nYgfsh8gjwGUEsS8pLbsNnwEWr+DAqEWy5OvIlLG6FWjmIBnvODIFoipEBupDgiwZM
	mbG5Khk0kvQDgTcGs8xYugP1UbXjJWzbEcg8hjEf6hfwPeHwo2ru40fyqLLfwIVJlHJy2+MCH1e
	mol/etKgcDpK3/uO2xqHNXq0bQqL38JyrvWOeQhTfYtGQ4U/6Bz29SBIzShD1JO3NIKegWTlKCw
	73o4kwRBSmexOcG2/UVNDvYg=
X-Received: by 2002:a05:7301:2b06:b0:304:2af3:5fef with SMTP id
 5a478bee46e88-3044921564fmr4123223eec.8.1779819719412; Tue, 26 May 2026
 11:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525202921.124698-1-dakr@kernel.org> <20260525202921.124698-3-dakr@kernel.org>
In-Reply-To: <20260525202921.124698-3-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 20:21:47 +0200
X-Gm-Features: AVHnY4LERaGUubmcoHWuZ6pDVh-Er4DRAsv1wa0D_Oc3ExDNDH2ULqOUOsIQmwA
Message-ID: <CANiq72mNqdOmQ3Va=EF-Fg+-BXW=O=px4z4+YQTS6wzL87=ZHQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/24] rust: alloc: remove `'static` bound on `ForeignOwnable`
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, viresh.kumar@linaro.org, m.wilczynski@samsung.com, 
	ukleinek@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	abdiel.janulgue@gmail.com, robin.murphy@arm.com, markus.probst@posteo.de, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	pcolberg@redhat.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 10:29=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> The `'static` bound is currently necessary because there's no
> restriction on the lifetime of the GAT. Add a `Self: 'a` bound to
> restrict possible lifetimes on `Borrowed` and `BorrowedMut`, and lift
> the `'static` requirement.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
