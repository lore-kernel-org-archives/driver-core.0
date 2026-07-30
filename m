Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9392D7393
	for <driver-core@lists.linux.dev>; Thu, 30 Jul 2026 14:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423341; cv=none; b=srOxVzvb/HaaitJxMOEe5+CKcVN8IkYMwABQ5aap+HT3qwqch+kqWUdVYru8OmjvmcN1SHMQijsc6crcZ2SaR26Wz6Q9RyxyJYFzTVve1v55LDbJ+oX71Wm7M37gLyC7gTG5AZ5v1QlAKafqRhxrrBIqFu9goAbL8c88W3R/qe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423341; c=relaxed/simple;
	bh=ynnqOp+fL3o9kKSR5OhAp0hTRoEdDY/H2zHWYl6VcPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IN1WGm08mlBlbNlm9Dl+CrmkCiO8qoiOGUwBX8gThknQ6PhsFnQGdU4Uha///VidYq7aVBpYJzZJa5ISDUFx8+c+OjfM5ZRym5tOTQVjQ83PHyIAUzgCePCkCyC73dICTSP7saaCw2/vF6Vopt76xle48wxNE6XJL0Xkv8T2uEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4583b1703d3so818222fac.3
        for <driver-core@lists.linux.dev>; Thu, 30 Jul 2026 07:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423338; x=1786028138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdSKHD8tzJ9JeGjNeD/cemvIL5cN9rQR/KTJiq4Qf/g=;
        b=isJn0/pPc/GSXhgmvTYGhsSvJpPggi/lDByDp5agIa3sIwbqiX33yZU7kUZvsAztmb
         atH35ouiUGFl9/ZJq/8PbELs46uso4//rsaQGogabXK14y7kg9+i+e2Ze8c5LPIPFtgM
         czFq5tiuZk0/8HPVHLKyyYfOJ3OJAledJgRnUL9i/4tQf/oyYtJrqzMj0OxevCa4t6Tt
         tjbp1FjDIBFWMDLZ+JcP7214FUdg18ooiu7OF/GeG4I3/BroBTm0pNmTj5YwxR3vSKuh
         VmTyz0glpkTprLTmz2y4C1Fbxb3UkylH/lNB1sXExQU7bTmFmgpGWapszCuSoNg4vsxp
         0Oug==
X-Forwarded-Encrypted: i=1; AHgh+RoTpZCT+zKpl5rGGpEuPio6deZJNIKkyDTNbI1wFEyY9Nj5u6Smg8Cy6enfuOQyaD0SpsKD5YqcHrUW6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnTPjyQpzI/v9LRm+k/bo5lYsgKXPXTN2J44tY/5m3o0eNYAw9
	cObztM7DCAurI7EjrcW6CBUW6+/cPmezHLHJM4y03g/FIeWXsiK6VLa2W9ICGu/E
X-Gm-Gg: AR+sD13MgM6lGhWRP6YqFGwZ1fExeemNK9ExK5sRcePb2PKLxCXmI1Dirbst0EwjRUI
	Pu0oTwAAOy10PISMo4a5qgljDkSP4Xt0DKj+hFW3k8wVCojRUr8qAmrucGE6egIqIw7uBFDHg6o
	BBt002RxvEWQainhVEROvV+K8+whp7i7EBchAHqh7RAS9ASKCEvRgR8D8ulprB5cCzvynYfeBnK
	Lin6YwlbTsI40YxzqgS2u/p4ao2uptwid0Zwh7hHYWnB6Vs2cIvW/l2Jhrnjmk5L7M7amdSrsyV
	m3fzOOB6J6AqafdZBTcXGL3qPxWEgOVis/8lpc1m9xA146liXielz2hzR3Jxut6y8VoU390dl3v
	0iG1Z6na/096er06Bcf+Ng4bxv0nOoa+p/Sjc9sbjb2lqPriqM+SfjOJyioj/IBXYivwvcLpZYD
	XUWa3cyV1IT9bmcdRovPCjfFOasDTNcHc/xm7ChNSAP8j5M5PGD0LtqFVrLCl+sBJ3Kn4jGpdoK
	GHaaSHL86w3B1OJumE/U0Gxzyaje+J7KBsu477+iCey19L0kM5Z8ZUVFs5ZnTBmR7648nZCHIyN
	rveNZpP+Ln0VKiJXAbsMm6TJ4SbuPn8hnlU=
X-Received: by 2002:a05:6870:de16:b0:447:4fc:1da1 with SMTP id 586e51a60fabf-458c0e5f6cbmr2053095fac.12.1785423338423;
        Thu, 30 Jul 2026 07:55:38 -0700 (PDT)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com. [209.85.210.45])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c2604facsm2239636fac.6.2026.07.30.07.55.37
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:55:37 -0700 (PDT)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso1083174a34.1
        for <driver-core@lists.linux.dev>; Thu, 30 Jul 2026 07:55:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpZ7BsWMp8BeqITXgG/Uvxtt6oWMPpqp62kHYm1mbpE1mDsYqzkafIymXD0e/frXatYtgBNoJgHCxaD4A==@lists.linux.dev
X-Received: by 2002:a05:6830:4181:b0:7e9:ea18:d1ef with SMTP id
 46e09a7af769-7f02c1c499dmr1923471a34.26.1785423336851; Thu, 30 Jul 2026
 07:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730004759.3089449-1-neal@gompa.dev> <2026073019-emoticon-decidable-200e@gregkh>
In-Reply-To: <2026073019-emoticon-decidable-200e@gregkh>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 30 Jul 2026 10:55:00 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
X-Gm-Features: AUfX_mwjt69Y4UONttNjpaGx_OmQhWJKzuOHScfgxTx8mxHBAZO42ivbKWNG3y0
Message-ID: <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
Subject: Re: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for Apple
 ARM platforms
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, asahi@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 2:01=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 29, 2026 at 08:42:58PM -0400, Neal Gompa wrote:
> > On Apple ARM machines (branded Apple Silicon Macs), there is
> > non-redistributable firmware provided in macOS that is required
> > for Linux to leverage the hardware to run properly.
> >
> > The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
> > touchscreen, and the trackpad.
> >
> > In order to ensure this firmware can be installed without messing
> > with firmware provided by linux-firmware and other packages that
> > put things in the tree, the empty "vendor" subdirectory was created
> > to serve this purpose. This directory is used by the asahi dracut
> > module as part of the Asahi Linux installation process to transfer
> > firmware from macOS to the newly installed Linux system.
>
> Why is this needed when there is the ability for userspace to add their
> own firmware search path to the list today?
>
> We aren't going to keep adding random paths here, please use the option
> that is designed specifically for this:
>
> >  * fw_path_para - module parameter - default is empty so this is ignore=
d
>
> Right there.

I was not familiar with this feature, and I had inherited the patch as
part of our cleanup effort to upstream the Asahi work. Sorry about
that!

Based on the documentation, this is the patch I've created for our
dracut module: https://github.com/AsahiLinux/asahi-scripts/pull/72

Is this how it is supposed to be used?


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
