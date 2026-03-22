Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB047136672
	for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 23:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774222628; cv=pass; b=gw9yq4ygsXl5gyMCrQaCbyJT9ptZRjS4vyGnc8ycOv+9s98Re9qg6fS4kEiA/qoaMU4oogpN4CjTnDfDNettSrHIL+sCta1w6LIuvxjlGHR5sV5mXu0SWDMiFnkKepElwaXaAZltnN3Jwql94hDPAh60qDMksEaqNfZh5mFliA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774222628; c=relaxed/simple;
	bh=d7PBNXoAWJ9oKyq5BMHE3IFpACdy7SKGVvq01Y8kijA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CzZ7ZG6k1zTdJcyfXESH+izJLR3acKrMJmbi1cZP7duuwRMq0jBczK74+OaoaAQ65cozyakFWibAI3so2mqSWmQ/6gI5tI1wNN88pc2mYB96FJNLBr1K1Trz0ha12u/5BmBeISXXuWuMAKGPy/zmTZDyVRCeD9tbfvF6aC3yIiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V/XYZt3j; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V/XYZt3j"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0f4a65bfaso97223eec.0
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 16:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774222625; cv=none;
        d=google.com; s=arc-20240605;
        b=YKPWmUas5JcBcfuK92zYxY+bq8IPsL6aHhPM81MaiYT7PN5sbL8tLbUCkWdQtoAT/h
         jDSkzKOzkM9dO+VBAsOj4ml9ZmUM2exnFmaOP9yZoUk5J+VrnLRU89ljAf7Hw+VFJ3Ok
         WiKmrvHTc76KGmRth3XCXixA2moi/KwNTiOgyRK2T4g+6DYLzus/adOAUfX8cAeubhmM
         kgnJyX10u4Ww3euWDo4/vaq5ydS0wDQwyqwZNkNGSE9G8T74HxEhkoTn8CfPur1eXbGV
         f+uaulHhxu2LMNfurqXyTLV7k+V/6VBn6yWwsfu7A9Fi/hsmA5FMDNTuVZof6TzvfoMx
         /8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3TFkIH6VCknZ8F6Tfn8RBWKBNHE4UMbauIDLil82xYA=;
        fh=+y1XLWImq5H9LrRUSV1ExjrKowlR1KSK8L/rinLveR4=;
        b=SMPIO2RrO9o5CMKhCn45coL9VWZq2WqGPo1YF88X0DrUgQJKgtCn87x2WLhEEPXodG
         MQJ4wB6+t1Ykkl/rY6EOJ+mZ8nqnxAtVjB/ViPBoT/EdaUViQDwV/NIzdEiOf+/IIIIg
         OKoRQs+d28MQFEfec3PaVn6XGu8ha7lOingnXCFZIe5LXFLp/7/GKf6xO7kQwReHKwy8
         xlBrQB/kY2wLI2OyNXkRF+Rez530ye5JDffzd6UshzZtSy4FOELjHq5jYG/BkTAosllv
         byYXvv/mZxdhdd8n1NrLd+oAuPv8YX+qZ8Z5nH5mc6j7tKgilRkt6L7tIyurA9B+8QPn
         Hlsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774222625; x=1774827425; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TFkIH6VCknZ8F6Tfn8RBWKBNHE4UMbauIDLil82xYA=;
        b=V/XYZt3jXOGpPo3fnSW4IkR6LOoabz/cwkO1p3nuEwcjA/eOYr1/esH/rJFRpaSpbX
         W/mFpZep1iT2s1SlnF8/sHuNIlN9y3myBZoUPkoQmpAEovdFjAbD+vJX6nveEUafHUlV
         uqrnz4VheSTvoXacgDuD0PWRWNQIhf6ME5PbK0OMDUFrmU7obU3VBtIuArrzH3ZNAUEy
         rQ7/1XUGTIdQ4Rx1dsZS/S25/tE55wk0qrNSMMf4+0hlwsNrtTNLmFU65K1/Rt/lQ8Ap
         RrfXq7rDrHg9yd5b4SU/+n1rTzS1aj7CeE+EdirqOGDr+aE8KlOQzZLGMTlU8dijbyns
         j5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774222625; x=1774827425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TFkIH6VCknZ8F6Tfn8RBWKBNHE4UMbauIDLil82xYA=;
        b=nl7ocscRUuAP1rYx1StdtSB4dMxTrqU7nU/63XW7ScUqflFddAIHnzOgDMjcvIczIf
         qqIb+9tWUodE/hJ7VO7Z2Rl5Vw77uXbil3bHcyvyrRp+nA88YmiUXbDQG9OWABtGWSvm
         3xmfWzVEVFRACFdxM4QTM7s9JS1BmZDYGrNpz7VYuOgQBwy8QFmqHP6dF6QcpNSyrIux
         Eur/7Kkviu0MurYTbMkwvFhIEz87PQPETZVmlvhfO8mlcnL+UW5625svL/oHIOVFtBGM
         pdp5diO505lD6xq+8bsIX3MFCYxtW4kBL8OoI0hD6Ce/ibL8bhp5Wk7kVDmEa5VsE5oV
         j9sA==
X-Forwarded-Encrypted: i=1; AJvYcCWj0LalYk/yH1zLJMa17EPjiuNL3aLF2jcDV0thngyYs8yxMoCIAueaFaxJS8BbVy42T3R2Yfv7q5726g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDVSr7GBlI97DSl+lNqXhSam4cyThuq/PbRmm8Xpczt034wRlZ
	Wi2ERwRPQomw030Q9u5EzRL2jruXrW4a5KT9fmKfqjOQOZ6E6skMQjzOmzIrUhB0KACNldnHu3K
	1+UCTIAlK2OsKh0UsPQC/TViNTxUhGwc=
X-Gm-Gg: ATEYQzxEkpXO7H4nR/HdxzmPaJSIH1emdZYAu2LCzFfuw4J02gO81Z/oi23ySgB4lPl
	Jy+Y5DO+PulY9c66SdCCFO5s+DkYRbMucM9u3eHW+Cr0jZEnuQ4M7wB/HI31YhMdEyUfu+b8X5T
	XR+D8abCtUms4XiT+Iv0grEF2oApjyxfvGR0wV+e+3cjoxV2ymnnGzxYDxUZ2Y9cEhecy/2mCx4
	Igbe9f+b6MX2s+GlbvTswZ1l5JF/+CZ3uyPAGEZ718GlNzdYaX9PsEeTq0EH6ArY2T1GNqYc8G/
	4DAMpMElBkvF58ttYIQj458JJlljYA6sMeRJQP4E+f31PR7LvhbNbrOJ8S6EbmE9E57ZsGjftPf
	NwSG1qZXm2fUZSbKM2hYx6tk=
X-Received: by 2002:a05:7300:d705:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2c109784e48mr2354158eec.6.1774222624794; Sun, 22 Mar 2026
 16:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-5-gary@kernel.org>
In-Reply-To: <20260319121653.2975748-5-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 00:36:52 +0100
X-Gm-Features: AQROBzARASkmL1z31d-SPolLvyqalzs_slFQDBddlVkhvWh2YgJFEiUU-Y1iEYQ
Message-ID: <CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Gary Guo <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Yury Norov <ynorov@nvidia.com>, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 1:17=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
>  rust/kernel/net/phy/reg.rs           |  8 +++++---

Tomonori: are you OK with these changes?

>  rust/kernel/num/bounded.rs           |  2 +-

Alexandre: are you OK with these changes?

>  rust/kernel/sync/atomic/internal.rs  |  9 ++++++---
>  rust/kernel/sync/atomic/predefine.rs |  2 +-
>  rust/kernel/sync/locked_by.rs        |  2 +-
>  rust/kernel/sync/refcount.rs         |  8 +++++---

Boqun: are you OK with these changes?

>  rust/kernel/xarray.rs                | 10 ++++++++--

Tamir, Andreas: are you OK with these changes?

> -    transmute::{AsBytes, FromBytes},
> +    transmute::{AsBytes, FromBytes}, //

Nit: We should take the chance to expand this.

Thanks all!

Cheers,
Miguel
