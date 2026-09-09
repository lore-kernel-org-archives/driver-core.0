Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626C7559C90
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957651; cv=pass; b=j7FVVzFjGwEY9CqIFRQXEpPfZ94Nb0tvVzdeHurV+7dZ39SWw9DQj3nFFhsR+WilIYuHA+ax4/3WtAKe6vmWEnsg7muT4OPvhh/dRJGPYm6M12XfzlQrxRWbGC5pLvjuiAYvb6ClZjK+HKXCLroMH9G0x9BNbxE8sSepLji8T+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957651; c=relaxed/simple;
	bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvzfAe4Kh82xius5jW9r/qcAdbNZ9h+4oll5CEQw0yJM0wTHGyGPT/heM/cCEnVXhWslnbjlEjfdB5+h6qE6arjJhzI5dh2vVRqfEQb4Mxqz5wC44UBeRHunQevIfp8s64QvB+UBFTb1mXoYH12YYB/dHmuY2azQ75W1SDk8D0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mitxz8q8; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mitxz8q8"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b1a806664so762405a91.3
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 05:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788957648; cv=none;
        d=google.com; s=arc-20260327;
        b=IJh62MXw5VgqQLq2ejCbreSn/MU7SFNW8iJ7ATbXCMTQInP9OvkmKCL5+X4Rpkhrpd
         VytL3/EgTw8+dTWK+LLCAuINPvRD0CIb/DZh06E2J9s87nrDXj/FcVyHa59trFQuSnrP
         oV9H5H8g9j71Ui28Rvq+A+xDRCB9eNAcPbszpIsFSoHlHSoNylgEm3IzMd33aSaBuV5n
         T2g/lrdF1WHNr+n493BQ23MT6Q0Meq+I50Vh2Lwg8x2VQvCo6yAPyWBbX4NZf/0BJw2w
         AtEpWY495vjh23erZjhXBDW1cZYzoShbD/oLqFkyx2dd1+LOl7xl8AtuprOWpoi7Hr53
         EPZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
        fh=s1pM1gjI1DlYnK8E8KZVSQXVZJrKX4H4sxEK9IaabpA=;
        b=FY0wDr0oMnoXimKBuGfs5G19pBIJi2trXDazKguQBXA+0evpKU/PG4EAJAPY1Lj/qP
         HxdjvSnumo/dmSbvwKPeq7alwKzkSKji3+ZvaYia1uhPHUynaIw49ZLVVXq3C/M0omXK
         vd5HGP7+aBVs5dI8fW34gq/rJdNziGvPz2/raiY8+zlvKGQe79+TcNJYc9RO4KcC0tQI
         vOke07+8hxASZ1ysV8Vj26YPgj2DEuxEUTK0z9IQCSgCrNtIK2qGhQFQ+rIEMRPlSTv1
         t2cH8Acj5NldqXbgbGxJ/kW4wHkKH9BBDXQK843pgJpiF42wdPMGMYaFkROPzXwQUfEj
         FaPg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788957648; x=1789562448; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
        b=Mitxz8q87zvilypwruNDCH9dUZV7WVuU7uaHBKrgEkHyXfBQ1KAa+CtmPTQQPjv5xG
         rCsbrQvSeBUHJSWwnd+kM87GDPDuCKjabU5r+Fma/pcjqSUHsxWGv84V6sNpz8e9Nx3y
         RyzNZFvj67PqWP/NJP20z6c/vB7rc3wcR8j7Wr3Jglmo9KwfFHVOzSByorczO5jw2o/Q
         IfSVU4eOZxMh21GIxGkE7A2z/7jfjKQNpZDS9cdKJ+Oj8n49Dt8wntJih2d/P3ETHkGp
         YJv6WhUeRj8Fx91lca9HZvNu0xdnLMYfiZaw56/JTJZdNtKCVZEluUzyFDkx6QI/vgOH
         Ks6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957648; x=1789562448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvYtV/SZ3/N68blqG6IXcgd9EYI6RO/7AwXt0HZiXpI=;
        b=KC2l1hApcxqstk13fjXi/6Lj0lt6dcFm95TL5sxG3sR0NCDLp1SOyGPLo5E2WHcmFY
         +r9haQNJS7A2MqF1yPb9/pwaotId4XkEGQFlZ7kPhGG89K3d6LeC9Ee5XTEdV5UC99nV
         B7iNCeQ9UW7Dv7QhysjJ0RtNL+4ElbFWh8Dm9n34rotBT6XD/GnNFNWjvJN5ovXacpa9
         JNIhixRJlVjYoJPsXvtl9ObDb5O+lmnbqxnOClxzGgZS5ISUV7LR0W9TEYLQMxKXNcXH
         mLFEWv1Yby6YBBrzjksEhokaRdsY/aKfiiKWr7MkLljMcuJQ1ITtbmu3QXg64D+8NIE6
         bHsA==
X-Forwarded-Encrypted: i=1; AKwUvBxIHkUO9SGRKyXzbTFw3DQ4DLb2RXvhZlqT9PnOZpaE1UeJurFq9zTt51t+aYNFbFbGH4HszEx0ADdV+A==@lists.linux.dev
X-Gm-Message-State: AFuF++nOKnLnj/SpuukmODB49n7UwPky4RCr4a3mMyxZ1NuwX3ZKDb1T
	/J9B912+YyXlGSPIz3dEOqNYc7bVi6vC4vXZoXdG4KH424YHIloSEgB1ym4/JFi7zQvRodPPsj2
	4425+A8M+1kYoxmkgbFRyGyf7UaR4qfQ=
X-Gm-Gg: AYBFou3vQGPB3fH65TNVZD8FdEY0ewKBwQ2WnbsX+Y4FhdBM8S3wPwXYMnvGXyWOvQ4
	5P8G/caBrEGbAT5IEMm3lAt9TqVm5NBi5mhroD1gEu5q7HxwsT/U5AOD04h8dJxrF/5kf4VUOMy
	3n3a+aIbPbQ6MGlBpbY4vIrfZs1bfSLt2qMdAe+PKjs3ySAKPrJHD2Nz0V2r0ctMOsN8MfxnrOE
	ROu3CfEvlLSskBj3X8oCgmCWJYnx8NHHSyRH8Dx9T0AXBAFQj1xN7YVcDq/cM+zIdTMv+tR6/8o
	Wz44oNWuyMDooSldWeWsy21hTqjiWEoVnEjz1rVjjIb8O8k3fmVp5YnqlozN3gXqvXxIqqP+PW7
	zWlOEEhQ7MOI4Fg4Gd8W0+BNuIaOl0fc3TsV+ksjigBY3FgmkhxAn8SlqTZwkiUAg5+3lIFEjO3
	z3CS0M4iCwpD2fd4dMDoPE2xrXgn6BsTj+P3U44BKo/TwSmlC3YBZHEOhC+D3JVg==
X-Received: by 2002:a17:90b:3843:b0:390:3936:8760 with SMTP id
 98e67ed59e1d1-39b3d3db82emr25928663a91.0.1788957647620; Wed, 09 Sep 2026
 05:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
 <2026090955-lustfully-fanning-33f9@gregkh> <DLAR1ECFC1WO.8NOBWPL6WM8E@nvidia.com>
In-Reply-To: <DLAR1ECFC1WO.8NOBWPL6WM8E@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 14:40:34 +0200
X-Gm-Features: AcwNN1XhXoN5_IFb34ArOzJVpKsqjlwNs9WCrPY6BaOeCuMJu7VIDDuOhdGDBiY
Message-ID: <CANiq72mCdDWsWD_O7LJ0i6rM-0C8p-pi-Wqvn4hTWv2Py5DMRg@mail.gmail.com>
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Georgios Androutsopoulos <georgeandrout13@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <iweiny@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 1:29=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Note that this is not a runtime panic, this method is only ever called
> in const context by the `auxiliary_device_table!` macro, so a panic here
> translates to a build error.

Yeah, this is one instance where `#[const_eval_only]` (or
`#[consteval]` or ...) will make it clearer.

Cheers,
Miguel
