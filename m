Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA853377EA4
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823635; cv=pass; b=DEjelx4ULSbLL/4UDR+W6wGBv6DyQWb8JsEIV4F2ea1G61HiGVaIsPH0z4mu+tkljvEKG2x5RaiR8tYVbYbAtBNHUcK+yaFrA67nu/QPvR6k/GJGCzVPdpOk+k2Iq2aZgl7PYyhXNpZx5O3GWi1gLcMqYQFQHz5jOJACWKwV7DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823635; c=relaxed/simple;
	bh=/df7Bk5n0RRFbF0Mk7wFm4tbv9pefyTHrec0whGPKKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVhc4VyzsZOxXCF8v77yaftmcvRfq39c53Y+NfQ5FdCJHlG0bqYh6S3fA3yzc1+Iel57SpLNxetZBDSbXNoakv2swBCtQt//kRMMyNdSPZ3oqXe+ZygIF5wmszOr/u3lU8BBJ33Ft8hRJZhT4avKqXreaWlN9oK7jlqVxYE8sB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mA3vQppS; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mA3vQppS"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4170e916d77so2109315fac.1
        for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 01:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773823633; cv=none;
        d=google.com; s=arc-20240605;
        b=V6dnDM6kL0tosXiPxB7otz7hQULWikR4d/XS7PEEAxkkfkjIu/T5cidj/Hd8NZNiic
         5su4iiu4D9K2DtJhv4Jym0kj/FD/MrLJCmXX1evP4aCHdvZiDwypZJiAjNKxhpjsOBAO
         1LGOC26vtrKIrSgQI0KHf/AoWAWFdmRu81rM6N+jRJLURRhMNyzNQb677gwXenVszXhB
         VGzSY+jcDgbzdHu9j4QNiEA5/UtkW1bGpowyoS11bwgr8mNHaEd7VKu+/Lcs+/aZ5jlj
         ayFqEukFSuPgfToFB/kRbcf4nXspHELLlXMmYC0aj14QoRSYbl2kx/9KphzfaO2IT5ZO
         59AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=83jPdky0qKJSRYzsoaPc+e5EHJzCiyWfR0yebjpaYT4=;
        fh=YlwwnVd944noAU4axC305xCCQfeMDxG0oBfTN+6hDCM=;
        b=eVLGhJ8NfYw1Wom3hFsUddBEkiMxz9UlAms8PTTzXkV/vMnXXYh45yxWgTt5gM6H38
         9O4p0U9NT0Vb4rW9IIPRdF+QD2aBOXkDMTkYVUqBCLU32b6CYY0/tis9PhZjcXk2OlOI
         ip//k4Z5eEyA19op53qMMx17RamnScUkNnkxDxIlVfKaJBAmsIho4AeewFrfKSl7cDYE
         UNYNrGLE6gJagKztq5tfe+bMvbusIf8gHCY1+19J4150J+w7HsHmLWF/xGudf4QxvRQn
         n3inrYg3RYv7TIlQmw8MyEtd9FoUoZ7E9MfPVou0+Z2JqE3p8nmxbf9Q6/J8Hf28OuZf
         7laQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823633; x=1774428433; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83jPdky0qKJSRYzsoaPc+e5EHJzCiyWfR0yebjpaYT4=;
        b=mA3vQppS4B8F9DXApPUw0YxGJw5MaUgcRrYJqQyJ4q4SZ2BTmOYsPLPOHh32ZFUEZ6
         fHqhnegPTaUCcTpAXwXHiKxNEJjG3deaBfRcTJ7s4JeetNxJIsFETTeAXb07eZWJRxdw
         UFwyOwGFYpQt1fwUX7amM0TqHm48c5d2c4PoL8jCzW2E3fqPOii08MjDslbrq9tMrXt5
         l456ucbkmI/1HkvUg3mbW7WO67BTKHa8f6MASpfHMVlS3ntSF/g/P25+Uq2JjHvo4GTw
         0r8OhGw0pv3jEjPSGM/4Wp0YsJmRP8MaUMJWy8q67M2UMej3LJ3lgphnYlwAD6gj7MgZ
         4Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823633; x=1774428433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=83jPdky0qKJSRYzsoaPc+e5EHJzCiyWfR0yebjpaYT4=;
        b=K+J6OTJsy7R1pPxhjiEsaQdYCfHH8cYU3jtPbCNO6/NZ8mosemS9bV9QOtzQ0PKAJQ
         O0YbUNjRa+S8vOGFpHKTirU3c5iSpPzEc5jNJ6sx5W1XKB2YBFUhgOfZ7VVqG7/RfvdZ
         cAknlL2YxQHWKRj0cLhjbpbohql2gOPNxs0+cu5pZcC54YSyZxiBcCQSnVPi9CbVcKHS
         NHcKdsvdnymkhmt7lv8225yI8etufxCuCqrj5S+zaD2BjMkQiy77QvDlAtPZjtOwOOA1
         PqRyDW4OxqoKVADj893Ch5Txmy0DvgbaCpLHFVBZWobfcGoYRoI7CfyDFCzT3Whhv/AM
         MyCg==
X-Forwarded-Encrypted: i=1; AJvYcCVSx3YPDMF0ivBz1SZ4jLI2zLzkgJEqh6wqW1PcXDUYRX/DvZko50EnSY0CgK79AEuHBMi2BFLnHmjXOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOKnMcXoPUNJ4P7uPTtX0hVfvW/9yq0tvYklw5q9qixWBurODU
	gLc4h+OPOSzYZjkuC8ylgpoIZ5SRxlpxcZAFTan5TqcvyagyQgfhrNlaHhLRAoHfZaziWLbr8n6
	Iq1SnmC2mnzcBbUl6n/eF0KmbzL0gT1I=
X-Gm-Gg: ATEYQzxnYOaVBdMcjw7fmr+AAprEhgIbf5ouMVZ+LulVfB6vYI0ehLXgT3aonzT6z0r
	J0t7516Xhl6TVg8kKtaPPFT/Z6ui4rjzIOLY9V7bOwyffY/KcPoEaOmzKkhLNcwA0b2jm9wtUz5
	9wGL10+7KlkgQNn9X0WtCrTNuO2rqsi9vxbUsQE6aY6UnxYES7aRJaPEIC/0wMt8UC/OXIvWtf7
	VrSZMsnlEL54vXauK/X2Tr1neh5rf43ONLSzAq9cdipDkHVipdV+nnGUMHTtqol7ENSdGEfeQ2W
	Rhy8c9TuGcQD2cyxaM2pq1yirsq0k1vNJZCgLT73JvGzNpjZ4+DOwzf1FoyCLwXKKJcc3sq8KE0
	=
X-Received: by 2002:a05:6871:286:b0:417:64ba:82cc with SMTP id
 586e51a60fabf-41bd421a82cmr1862712fac.43.1773823632659; Wed, 18 Mar 2026
 01:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317185920.43387-1-hanguidong02@gmail.com>
 <20260317191538.43535-1-hanguidong02@gmail.com> <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
 <CALbr=LadoX8g--rtU==HQfNQ9f1=KP=7AS-PGfooKaSbnYPz+Q@mail.gmail.com> <8ac4b6ef2dfbc1dce0047dee55f2df609287a3ec@intel.com>
In-Reply-To: <8ac4b6ef2dfbc1dce0047dee55f2df609287a3ec@intel.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 18 Mar 2026 16:47:00 +0800
X-Gm-Features: AaiRm51Yf9dm9cacIuRM_2DJNr3deiXg0cux6KcppyZN1nJwEpt6FR9vmcrqdC8
Message-ID: <CALbr=LboxkVoFrRmZoq7LN=LTL+-ZgoUiTi6utSDEw7M_qX8bA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/i915/display: initialize string params to empty strings
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org, rafael@kernel.org, 
	rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, 
	airlied@gmail.com, simona@ffwll.ch, gustavo.sousa@intel.com, 
	demarchi@kernel.org, jouni.hogander@intel.com, luciano.coelho@intel.com, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org, 
	akaieurus@gmail.com, me@ziyao.cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 4:32=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> > On Wed, Mar 18, 2026 at 4:12=E2=80=AFAM Jani Nikula <jani.nikula@linux.=
intel.com> wrote:
> >>
> >> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> >> > Passing NULL to debugfs_create_str() causes a NULL pointer dereferen=
ce
> >> > upon reading, and is no longer permitted. Change the default values =
of
> >> > dmc_firmware_path and vbt_firmware to empty strings ("").
> >> >
> >> > Existing code that consumes these parameters already verifies both
> >> > pointer validity and string length, so empty strings are handled
> >> > correctly. Furthermore, heap allocation is not required here: these
> >> > debugfs parameters are created with strictly read-only permissions
> >> > (0400). As a result, the debugfs write operation is never invoked,
> >> > meaning the static empty string will not be erroneously freed by
> >> > kfree().
> >> >
> >> > Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to di=
splay params")
> >> > Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module par=
ameter under display")
> >> > Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/d=
rivers/gpu/drm/i915/display/intel_display_params.h
> >> > index b95ecf728daa..0a8cad98d480 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > @@ -23,8 +23,8 @@ struct drm_printer;
> >> >   *       debugfs file
> >> >   */
> >> >  #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
> >> > -     param(char *, dmc_firmware_path, NULL, 0400) \
> >> > -     param(char *, vbt_firmware, NULL, 0400) \
> >> > +     param(char *, dmc_firmware_path, "", 0400) \
> >> > +     param(char *, vbt_firmware, "", 0400) \
> >>
> >> Admittedly this is all very convoluted, but these NULL pointers (or
> >> pointers to them) are never passed to debugfs_create_str().
> >
> > Hi Jani,
> >
> > Thanks for your review.
> >
> > Could you elaborate on why they are never passed? Looking at
> > intel_display_debugfs_params.c, the intel_display_debugfs_params()
> > function iterates over INTEL_DISPLAY_PARAMS_FOR_EACH using the
> > REGISTER macro. This eventually calls
> > _intel_display_param_create_file(), which uses _Generic to dispatch
> > char ** types to debugfs_create_str().
>
> In _intel_display_param_create_file(), valp is &display->params.x, where
> x is dmc_firmware_path or vbt_firmware.
>
> display->params gets initialized using intel_display_params_copy() when
> struct intel_display is allocated in intel_display_device_probe(). In
> intel_display_params_copy(), _param_dup_charp() handles the NULL
> initializer.
>
> Granted, if the kstrdup() fails, you could end up having NULL there, but
> at that point it's fine if your debugfs_create_str() change barfs and
> bails out.
>
> Like I said, it's convoluted. ;)

Ah, that makes perfect sense.

Thanks for taking the time to explain this in detail! Then we could
drop this patch from the series.

Thanks.
