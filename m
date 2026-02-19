Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8AB347FD9
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 17:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771522336; cv=none; b=KCgoHxkDE5yaXVbSNKHHKIWsVGMB4MjQe9nSOObiomXwa7g6/hAT13shYllzPZMuosLcgc+OnUuRL0+Z3zUn9PaRGBBBBZ2slSCwwo0ELFxoIaiieJ9NK1DIwYguwjEfJRu62VyYbj1CAxUNq50uG8bvq9J9Mm7Im8dZhcrXvPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771522336; c=relaxed/simple;
	bh=Vu3dc7VXhNo7YAZXUNlqsloaCwPp8S67KVxm6uCFDyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FpUGcqZjUp+gdAVaV0M5/Z3fZBjCtYjC5jSoNxl+5vI2ezC/0VpnltTB0U+e2D50xPkEgDEeF4ggc7YC2sdhYTGwgVOXvfWK8yltzOixS/4fqg8Kdm9/zxi6V8FXA7T74uyQaHtszog/QgF8qZFurZHtayHqdv9NkYq5VYNxmfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shFxprcD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shFxprcD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033CFC4CEF7
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771522336;
	bh=Vu3dc7VXhNo7YAZXUNlqsloaCwPp8S67KVxm6uCFDyU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=shFxprcD6RhrjfJMO7vm5yaC5FR9ci5aH9m/296gWuSHjXi8uBw5RQlH9y7YEy+QJ
	 KC1OeWbElWHgFgSCLxrwROqXqocFxNJL1YK5WxHRNKvQ+ECkJB7tj8cOGRoj4Vgqpl
	 snivMdSpBdbPo9hTqeIgncZFpBdCPyMGjbl9h1YZUmZ9TRLbwGo3lW5zXLHa9mbf6T
	 dZq6EVmxokhhU1gEUdMaiS/CEB3jwp1ZXVOZzDYzhb2Zz90Z8w3dPesKqy9dhhLSbe
	 lByBZL7QzV8MjTb7G5ba3Bgpy+SicBZPX3TEfiNmVjDJwcr2+TxmE6VBbUuiC4upqx
	 JDWxd4GztXktw==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64aea64bf15so1238618d50.2
        for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 09:32:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPwa/4PSnvHH21qYjDUSMB9rkhXMRvmLbjPK1z6KHeme5YUsdri1gE7+Ow8pw4YeOHTmVJ1piFHHJhnA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2jl3UB2BD6slFV51OrESO0vbGtCIcE/gRb705ih26xga+RSMI
	m+wXid96ZisyzZ4B68lHgqG15QXICBfZVlTz0HP0oyLoMUDhhJuqGkQkuk9ximkHrLwpOXfcHX2
	JpbjryvhXgAwtisqx3YoXquDo23rhXJ8=
X-Received: by 2002:a05:690e:12c5:b0:64a:d294:e502 with SMTP id
 956f58d0204a3-64c556d2cb8mr3920242d50.66.1771522335289; Thu, 19 Feb 2026
 09:32:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
In-Reply-To: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Feb 2026 18:32:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLn0L6CShJuC8eFjyXGhVyQ-3HPth-F9h8iiOgmaaJxuBw@mail.gmail.com>
X-Gm-Features: AaiRm51KpSSnKkBgiDlHDuMcf7Hg9oSyJzscgWpJoCdTuDxDwtHztJAqT9eZhrM
Message-ID: <CAD++jLn0L6CShJuC8eFjyXGhVyQ-3HPth-F9h8iiOgmaaJxuBw@mail.gmail.com>
Subject: Re: [PATCH 0/2] driver core: provide and use device_match_fwnode_ext()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 5:31=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> In GPIOLIB, during fwnode lookup, after having resolved the consumer's
> reference to a specific fwnode, we only match it against the primary
> node of the controllers. Let's extend that to also the secondary node by
> providing a new variant of device_match_fwnode() and using it in GPIO
> core.
>
> Link: https://lore.kernel.org/all/aZUIFiOYt6GOlDQx@google.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

The concept (+/- code comments):
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
