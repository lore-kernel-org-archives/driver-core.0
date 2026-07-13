Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D97C3D5673
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933076; cv=pass; b=R5LzPMwWswrqldB4w6Zqa9juXsGoA9Yz6cr9UtYYHFL1hANH9wqIsyDQ4TeyZeEi52keYCDn4G3mgSN1Viz7C6dI61n0A/RMz5E3rSqMCkvQRD0HCIQ1fZf2iqiufYqOFQTSe/MpjqVLb9lgmmZKKfTyuBEZnoyWMjxsL5PesII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933076; c=relaxed/simple;
	bh=zGXlgemVtM/fd1QacjWZsPwmu1tJ8IeGxyTqkvyGisI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k5LtOBHXRYvQd69ZjVETYMgTpFQtIkVuhMyC6HR8IW6fTbghRm0rEt1Bl/mN0sPsHhNVOQP1UhSopC/QqRyEELu9WimL+Phb6OqbVCocYjsqEk2cOk9h6S4tmKmNvl7ID2zoDORBt14bajIbDm2ycFV2HyNxUV5nfs5F3Sv2zzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tw4qg1dt; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tw4qg1dt"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1170075f8f.0
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 01:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783933071; cv=none;
        d=google.com; s=arc-20260327;
        b=WTJAry+1hlQAF2jrEGBJz1u4P5kLor6T7ZwBzIEIm3rCNS6vdkWN72I9TyfxAOr7Cc
         jR/DQgttSk1hbdU4z6QKJ99ejkjrJsIvvOh/MHqA2Tt8YfQdLEo4/mDycwh52HXozAfD
         e5tnXr7j5vtGFjOenhf9oQDZ8OfSClS5o9gZiIWKiKHmpq7u5S27yT22ysuBozAWZ07S
         fxZZKK+EXuDL0xjYbOWXodHZ5Y1xOBF3HFUd1uSvm6kB/fF798hdK3sQnLGRbNi90TBG
         EXGsKCFXkWwJVg6wrFF8tFugYGrEQTK5MqRl52s6NqrOOpYFjwXizbJkIBxyMHPIK813
         Q2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Niw6ma3uSQo4Oag5BSyj5O/UfANxhnZNo3KLkxIFV/I=;
        fh=ocpP1owTMNfQ4d3CLZqTUqyB3dNnw34o/1REaWgdD4Y=;
        b=GUzH/47nE0oM5Kr8tBz8UBajtwRIkwE7kGcVtUYDZYx3bH1DS9yHcHQoxpEgV9tbWs
         jG2kINjXCJg57cW9HK22kJZv2MucPB5XP2vyJz0w/giiYx7WW58/PjtqPKCdjFLZv0Ov
         0EGgF4ks9j4HfZD1+pkfWxCqIlffpmk7Hjy0h1ArNcwCKF+/wixpUCiKeAN1T7f6/Jhl
         5XjYcjYXSbg2paDXbbn7pBwyPoFkt/A0MOiNWm3ohnawJ0jRrZ6Vh5L6eNYhifVgnrxE
         ltJDVpMWhtwJr7vNYKJbZ+c88yA+vb/qiZ9soqWkgJ6lvDbC5CrvCEV4hfQKkj521itK
         E5AQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783933071; x=1784537871; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Niw6ma3uSQo4Oag5BSyj5O/UfANxhnZNo3KLkxIFV/I=;
        b=tw4qg1dt6K86DP8dP3KqcoY7kwrq0jCrmnP98XpiNGOTOr7UFbeQLiiMiK30DPCyA1
         kgHGALyeejimRS7/3N49tFK7Vqse9YqFjSbVGNs3xRIAfo2cr/mQiEsfkXBPdTj4cBLo
         g3CszI4sSWUyWcz59XLLiAGAYw5T/jdOfpZlovdbrRbhrZCcXCoC0TRkfgBDxkvWfYeZ
         HPGznq/yhQK1zTFsUGmPbjrOchFwXWF9D/Yth/sUoNolQZXfdnD6yN+jGxMB6D3bIgnp
         BXPX5N+DAph9o2K29COBJ/uyf/18O6FdZAEpBgtbS/v4gnL3yeVzwROr2Molr9XyaK3g
         H0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933071; x=1784537871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Niw6ma3uSQo4Oag5BSyj5O/UfANxhnZNo3KLkxIFV/I=;
        b=fC7yENJ9QAKdE06mVyCTpCFLSGEiB2QpK6pniZ7F2H5Z7B6KsLqkGIv+c3bngMX7s2
         MGruo8wFkUMvj6AFlGiwd34ieQlWu2+zKLp8fGPLtpM2yvYEcFzW4hb5p13hNeeC22aw
         peDUs7ifZfI7M5+BB0d+W8XI6wtskwej6NVR0CelQpH8loPhQL/b+faM+MRm6fUd1fi/
         AiMh6Id43E56WsnoD0PKO2/qoVrUd2JyDzmUF9N9r2orjdG0aDRjQ8SW9Qtc5Zsz2PTc
         3QwWSKhIcaUy9LU6CfHTg6uUfBtqfb/9CRrvO/XzUDBsj6H/RjkgNjagzeoGKnT1eH+F
         v6zA==
X-Forwarded-Encrypted: i=1; AHgh+RpQExgPblY9fB5LEVuFcbnJQheKs2uHLZU1AfQh5XH+B0YDZCsDlCIXnFJC/qpFufEavCmyst0NZL9UAw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw821IqsoN9ZY1UzmDrUccQpE6+qDlc946tpmsiSD6pGkeqQ6CO
	PkuD6QrQCLrIiv+i88kd0PQT5UjBslIFLGLj4YBOhREC5xL8TQOPUSXQZ7uV0ww1Ym10zBCP3Jh
	A3A4tQ2zG2fR5/VFZ/PueRDYMMj9pXJXpCTujo+le
X-Gm-Gg: AfdE7cl/NWNTRIq3pxw/2H2jg5A3tqKnJ/QU9AjsjJSAD6xIOCFfnCNYNr3FSi2b699
	Xa8pPBT63GjsoQzRyFfZPP+p8bfrapMUsdAbgX2R0PobsRRmKmHfD1VWAjJul0xbGiM3Fkcwt+a
	N28ZJhRlpmsFYhpmdd65I3djvpujhRTwXoZZmVZq6bboCtdsSUmG8LrjWp4U7IJ3CChPz29fd9f
	TolbyoOuLHrFWm1/9y2iOpCf8qpScjb0heCEWyZAVEXX9LgeSmu7w7J25W28TNZ/89s3spH6BaC
	tZz6l8VREJbLNOTvnD1x2behGaw3l0c6nEU4kvQNC0rz/IqMyVU52/I+7vHXJqaLxtwruA==
X-Received: by 2002:a5d:5850:0:b0:472:55a:ef9b with SMTP id
 ffacd0b85a97d-47f2dcac418mr8602513f8f.8.1783933070140; Mon, 13 Jul 2026
 01:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260713-fix-fops-owner-v8-0-2495cfa82d47@linux.dev>
 <20260713-fix-fops-owner-v8-10-2495cfa82d47@linux.dev> <alSe6PsvdrSYP_Z0@google.com>
 <d7c1607f-ea74-442a-9700-7fc4f0c64b76@linux.dev>
In-Reply-To: <d7c1607f-ea74-442a-9700-7fc4f0c64b76@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jul 2026 10:57:37 +0200
X-Gm-Features: AUfX_mw1uUYgV4eMXkVflbUYoDKpPh-OOQHMx0yAVcG6yUMQsdEhmzk4SLg_fQ0
Message-ID: <CAH5fLggszOnUm7Rykt41V91de8h9YVaZt49wr52i3t5-QV84Xg@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] rust: module: update MAINTAINERS to cover module.rs
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 10:48=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wr=
ote:
>
>
> On 7/13/26 16:16, Alice Ryhl wrote:
> > On Mon, Jul 13, 2026 at 02:45:31PM +0800, Alvin Sun wrote:
> >> Module types now live in `rust/kernel/module.rs` alongside
> >> `rust/kernel/module_param.rs`. Update the MODULE SUPPORT file pattern
> >> from `rust/kernel/module_param.rs` to `rust/kernel/module*.rs` so both
> >> files are covered.
> >>
> >> Cc: Petr Pavlu <petr.pavlu@suse.com>
> >> Assisted-by: opencode:glm-5.2
> >> Link: https://lore.kernel.org/rust-for-linux/8ea21b29-9baf-4926-a16f-7=
d21c5a1a1b8@suse.com
> >> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> >> ---
> >>   MAINTAINERS | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index e035a3be797c4..74733de3e41ee 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -17984,7 +17984,7 @@ F:   include/linux/module*.h
> >>   F: kernel/module/
> >>   F: lib/test_kmod.c
> >>   F: lib/tests/module/
> >> -F:  rust/kernel/module_param.rs
> >> +F:  rust/kernel/module*.rs
> >>   F: rust/macros/module.rs
> >>   F: scripts/module*
> >>   F: tools/testing/selftests/kmod/
> > Is there a reason why this is a separate commit from the commit that
> > introduces rust/kernel/module.rs file?
>
> Gary asked the same on v6; `git log` shows MAINTAINERS changes are
> conventionally
> standalone commits with a `MAINTAINERS: ` prefix, so I kept it separate.
> Gary agreed [1].
>
> [1]:
> https://lore.kernel.org/rust-for-linux/DJJ26195JBS9.D3DNLZPRJYO4@garyguo.=
net/

Ok, that's fine then.

Alice
