Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6769333B6EF
	for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 08:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769590649; cv=none; b=Kgd6AcTcReYgjcrMYNrI/R0tqpYEcb95m0JxYtP2wKruDM9COZiHv9X06/Wr5zrtK7gEhd8rxyGAQ/DFF0HBG5PbQiqLyXDlr60DxIifsfPSgsxeV11JRyTiE+0FBTWOoTjClKnhPzedzdYEDWvEf4ZSk05ZOwABrCYvdD32q4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769590649; c=relaxed/simple;
	bh=ZghCFjy5Vl4uM4uCuKuBt6WpSu0c9RUlE86wYJFHhdU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URDvFvDTe2DPgIleVJeIv1/FP65pCzcZyUV1s12nQSwN/EuNsxtWC2Pv1qIKJm3FhS3JQ4w4Z5tRtDRS8SqeOcpplimy+fwXM3I9DxxdaIQPU/RcLDJWfX1pp4SKbacYJh203Ob6ovRoOfn2MAkDeJn6JQ6y31RWtPehGJJU40E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DumXYqcR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DumXYqcR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3577BC4AF0C
	for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 08:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769590649;
	bh=ZghCFjy5Vl4uM4uCuKuBt6WpSu0c9RUlE86wYJFHhdU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=DumXYqcR9zXUektKQP9grbUMZImpoZcfCL1qap4xXtzk3yVE+QBmkRukEovAPjGrG
	 lEHgGzEZPC19e1aSyUpkYqW+TuSOVWmggWkhTZrx485oXQQpG+niwdWA4HE2Wxhj2F
	 Jk7x9fK0NN3hG/oLTtZCkt7490FUqDf69NJETxDgVgOvkwA3IG9ZaQ8MdW18nLxF/8
	 gw1Y/lEaBmyXJbxS1VAqSnF3rDJTYyu3Qxk6CAEYVJDREPPpUFHzDv6VzhrODL48n6
	 rrtFVBj87j09V9FqkYLCZjjWqf8e7KTXaeL9FxqdT8w5zPhe6Xx8FhoDskCr6oo2UL
	 eEQ5ZdwFRl8cQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59de6abf324so4647221e87.3
        for <driver-core@lists.linux.dev>; Wed, 28 Jan 2026 00:57:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrvI3l80oZHJ+mxwQgdrcIDA7bbLigCbZNk+9KKKhf4p5qaBwuk7rajxCD0+zJLyHCFTp15xP3ovqZxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDzHRcBHjDFqttz1Ky2CndjYPipHfmkaHNPAxDfIjdDsydotlJ
	nR8qmHJcIxg7XrInyJLtlYd5j8d/ngegFjairWQsJ2uaxUmH01xtjx6b15PYaOZeWgLyLKq/tkb
	qLZFI9PPWPaeu/lrqTpFmv5kXcRBct4syHHw+fMZq6Q==
X-Received: by 2002:a05:6512:3e02:b0:577:6e42:3718 with SMTP id
 2adb3069b0e04-59e04015376mr1851496e87.7.1769590647815; Wed, 28 Jan 2026
 00:57:27 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 00:57:26 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 00:57:26 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260127103325.3925173-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com> <20260127103325.3925173-2-andriy.shevchenko@linux.intel.com>
Date: Wed, 28 Jan 2026 00:57:26 -0800
X-Gmail-Original-Message-ID: <CAMRc=MeNOX8ob0y89Gx9u3U3G7jmhmdvv-u3vqnFqv04EOEFGA@mail.gmail.com>
X-Gm-Features: AZwV_QiaWF6S2zXsXWU5GAAmA9-LLTqcfAROoyRkpsJQMqGVH1YJzm0KMfvQkck
Message-ID: <CAMRc=MeNOX8ob0y89Gx9u3U3G7jmhmdvv-u3vqnFqv04EOEFGA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] pinctrl: core: Remove unused devm_pinctrl_unregister()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Philipp Stanner <phasta@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Jan 2026 11:32:06 +0100, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> There are no users, drop it for good.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
