Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9A78F26
	for <driver-core@lists.linux.dev>; Thu, 28 May 2026 05:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946689; cv=pass; b=S80iwBZlHk+qKd3Zcr0tcknZB1XjbzKG48060U8KE19raStn/urokrhPh8Ba0LYy0kdrZimD3PDRfJi/Vd8kHx/ttzdccqRs75EMQrG/y3KThVBswHWDdr9lFhJLVcVR1GtN2G6CCC0w2uwElJ6wmB4QtdTlpx2RM4cStFW+iaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946689; c=relaxed/simple;
	bh=GtASnD8UTdgwS3JmQzjMUOpP0XbWfsSpTWn8zHybqlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmO3IzJMG/EkgVEAjMkRTKYSn28GQeFZpU5m9hSmu7Hc7PO7DG7Y7z1YRTtKyQzVTB9DVZ3qtsKnHsJ+dv6LoFK/mba3r300I0TgyK7XPsSAptgRCI7HPLG0k2SDZQ6o8TRrS8bxTf2FCVYzyF1suu0P9NFVB5NTFAkGDXhYAQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AwruTlPS; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AwruTlPS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b9e9a6802aso54349075ad.3
        for <driver-core@lists.linux.dev>; Wed, 27 May 2026 22:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779946687; cv=none;
        d=google.com; s=arc-20240605;
        b=gMk/g5NmDIF6o/Hd0SmJCw1iZomggH4b8L/aRMSHlgFvKRRCdMgCzhsJRaju5hPX4u
         VktviYO3wkVD4wrETT6PIQLayaiKfnVPu+RHdsZzZmwK9maU5m2qPT8dBLo+xhdiTHvv
         N+t81cy+5utu8hzOOJXvt/sONNbRHiQ2chZ25LFxxnKj8e6lrH/vOFMKUsaklUDKiZ8B
         ywWhzRUeXLKLL4Ng/UcGKlFYux4tSrV7OcszL97weyFOs+CUZ8DCBGDp67zku/fnWzZg
         yeml+58GHH1rF0ZB7mF3xsbR7pWgoIUfFMqbP+qbNNbNlv7VLMX/qW7YnE8PDVzRbkZv
         EOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qQAJo6rZoh+Fxh5Y2tA5P1HVMSoCB6UXogwWan4NG9c=;
        fh=ZCSdfX/HkqOkjTQ3meeuAmAu4ULM3rxoUUUKc5cmjqU=;
        b=HU9KnSdGeuI5WDFINkpVAhF9x7IoDeV1o0KUH3OhUPvjp0DinmUlBdt1S8cyC1i2q1
         u9nsbZqMXyJfdgjzsoj5OvCRFy8Sff9ZcPbgX1EOVYP+qA71CzFdrYXfkFBfXSTmVQeq
         /t1+ZhKELYo2Uq05GMsbJmh96r/6bP+0uFsIA2ZtppmREcm0jHvUA5zYbXMx/oGmKM1z
         dPoWY/AANFTi9ETCkipLP7ImfyyXAvPkB4DwCtJir2sqdpqtqwYJNnegt8F0KGYWra6o
         RMuMYrTh+M4JE8ZaFfKamlnbwQ0ixdOa2HCIYx7eY1KY2vV2RGczpj7prc1qNDKROpFh
         hvSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946687; x=1780551487; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQAJo6rZoh+Fxh5Y2tA5P1HVMSoCB6UXogwWan4NG9c=;
        b=AwruTlPSsMemVSynM4bMybY1A9hGqIexYm8H5kcow14DcOa+OklSAwcKAW2hUWdLXe
         2Tj9BQkoCpn2cLA0mJtz1RWwtL7xNncwBZvdNyLv5maGEA7rbwUPwbBgHU9x36W7wj8h
         IfE4o8wVTO5tHCEsoWIeDCz9deDztHfrPETzMe9AJPwf3EyfY+scubP8YylWesSwbUhl
         7y1/W+/6SBoYijEbROe1JINZcrN+9BOL9DRWuQ+wQVCXMCE7BLqb97XwCjr1TXwikGZk
         bx7Qf64afGQUAVOjgycyE2pIVZTAiTSQabo1gLBskhSoZ4NAxLCKUTpAkreDTca5Nx7A
         I3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946687; x=1780551487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQAJo6rZoh+Fxh5Y2tA5P1HVMSoCB6UXogwWan4NG9c=;
        b=tJ+YKb0iMsc7uQJhOi9AGSbpBHXlh5GOK9iMPrCmRRPgEM108KWDIkgtzhUzDkclni
         jNHWo2RCU1PyBsr8vTFbqnduGP4+SPl//6yvXLqRt/EDu3AD2p9gAkzaao+zEDTiumzm
         qOMvW1bMZllh1ufbTrJ256T3cVI87xYr4sJzDroovT5VPS1hPdUcdDCUiSRM9ok8Bx5O
         s8MaKIOu6ZlxqUtoOx7z7XFNIXI4X/07yCGDEeyQNLDhPNF4ZDRiSWGgFQ5+Tise+BoK
         XpNRvBLdFxD0Tp3LQQkvilQbKUEadUza5VGJlBUGRymq4dJ/2M/h2TFDl8k9OhtgDf/F
         rrGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/PbdnYWiarOPcIS2rgIQyrucirOfMX99ZwpMkKAsEZbSZmDz0sR7X3MsrDlzEXhfh/0+nfsBhoZYdHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7pQdLpXU4FOKNVsDoMsx52lRGkhcZ8N7BVYedGWqcnRro8gOZ
	x3TgVHjen9KG9cVxKBBZXufVQEHJ5LGxuMyFmRZ6N1r8oy6h7f+5r/fljHiAurM2vwImaQzEl+7
	52OyCrI8YlkV4scN9QzF9XCHLmqDPfsY=
X-Gm-Gg: Acq92OGjdL8+68xraRSbIFBcFSevMiUX260gbtFcCzOdq4wlitK7WZvO14lnoxeoBML
	7XHzY/N+wBEVX0m1YpwktI7mKwJkacFsZEHRx3Stp1b3KDpUE/frKVk8w8iwBhhcySaXfLfnNpC
	ol8h3wiosibTmmr1zjonnSVLf2zjnmslJQvR/kCZ9EzW/y4FWjgHKyo8Pxou6ytmBx9JE7Ta5VV
	Hbv1rSsa5IFZwdB9UjIQL3p9UQ8OEXjIfTjnXfZuM0e4Jddtzvw7SXWeWltyN6ySyM9fGiPjdvk
	oWmxTrXx6za6DfjvxzwAfpnSnEj1p8CnpUoeafG543k6qtYF
X-Received: by 2002:a17:902:ebc2:b0:2ba:6ca2:be0 with SMTP id
 d9443c01a7336-2beb0346614mr267366065ad.4.1779946687095; Wed, 27 May 2026
 22:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528053021.46157-1-phucduc.bui@gmail.com>
In-Reply-To: <20260528053021.46157-1-phucduc.bui@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 28 May 2026 12:37:56 +0700
X-Gm-Features: AVHnY4IWH_R039yRdVb-Mcqa38p265MQSq00NsEjimRkQTW29lTfeju46N04FvI
Message-ID: <CAABR9nHFBp8usA=2NEm6f+mB4vNYwfpVLQVavqe-nDNznKKZsQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sti: uniperif_reader: Use guard() for spin locks
To: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry, I sent the wrong patch by mistake.

Please ignore this patch and refer to the correct patch here:
https://lore.kernel.org/all/20260528053204.46783-1-phucduc.bui@gmail.com/

Best Regards,
Phuc

On Thu, May 28, 2026 at 12:30=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Clean up the code using guard() for spin locks.
> Merely code refactoring, and no behavior change.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>
> Compile-tested only.
>
>  sound/soc/sti/uniperif_reader.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/sound/soc/sti/uniperif_reader.c b/sound/soc/sti/uniperif_rea=
der.c
> index 05ea2b794eb9..45d7613f595c 100644
> --- a/sound/soc/sti/uniperif_reader.c
> +++ b/sound/soc/sti/uniperif_reader.c
> @@ -46,15 +46,16 @@ static irqreturn_t uni_reader_irq_handler(int irq, vo=
id *dev_id)
>         struct uniperif *reader =3D dev_id;
>         unsigned int status;
>
> -       spin_lock(&reader->irq_lock);
> +       guard(spinlock)(&reader->irq_lock);
>         if (!reader->substream)
> -               goto irq_spin_unlock;
> +               return ret;
>
>         snd_pcm_stream_lock(reader->substream);
>         if (reader->state =3D=3D UNIPERIF_STATE_STOPPED) {
>                 /* Unexpected IRQ: do nothing */
>                 dev_warn(reader->dev, "unexpected IRQ\n");
> -               goto stream_unlock;
> +               snd_pcm_stream_unlock(reader->substream);
> +               return ret;
>         }
>
>         /* Get interrupt status & clear them immediately */
> @@ -70,10 +71,7 @@ static irqreturn_t uni_reader_irq_handler(int irq, voi=
d *dev_id)
>                 ret =3D IRQ_HANDLED;
>         }
>
> -stream_unlock:
>         snd_pcm_stream_unlock(reader->substream);
> -irq_spin_unlock:
> -       spin_unlock(&reader->irq_lock);
>
>         return ret;
>  }
> @@ -355,12 +353,10 @@ static int uni_reader_startup(struct snd_pcm_substr=
eam *substream,
>  {
>         struct sti_uniperiph_data *priv =3D snd_soc_dai_get_drvdata(dai);
>         struct uniperif *reader =3D priv->dai_data.uni;
> -       unsigned long flags;
>         int ret;
>
> -       spin_lock_irqsave(&reader->irq_lock, flags);
> -       reader->substream =3D substream;
> -       spin_unlock_irqrestore(&reader->irq_lock, flags);
> +       scoped_guard(spinlock_irqsave, &reader->irq_lock)
> +               reader->substream =3D substream;
>
>         if (!UNIPERIF_TYPE_IS_TDM(reader))
>                 return 0;
> @@ -386,15 +382,13 @@ static void uni_reader_shutdown(struct snd_pcm_subs=
tream *substream,
>  {
>         struct sti_uniperiph_data *priv =3D snd_soc_dai_get_drvdata(dai);
>         struct uniperif *reader =3D priv->dai_data.uni;
> -       unsigned long flags;
>
> -       spin_lock_irqsave(&reader->irq_lock, flags);
> +       guard(spinlock_irqsave)(&reader->irq_lock);
>         if (reader->state !=3D UNIPERIF_STATE_STOPPED) {
>                 /* Stop the reader */
>                 uni_reader_stop(reader);
>         }
>         reader->substream =3D NULL;
> -       spin_unlock_irqrestore(&reader->irq_lock, flags);
>  }
>
>  static const struct snd_soc_dai_ops uni_reader_dai_ops =3D {
> --
> 2.43.0
>
