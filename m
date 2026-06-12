Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D685028C2A1
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781248832; cv=pass; b=tnVr+GpBSQNN8s2AUSMrx064woBIsHYCCjdsT67kCrdiEW3xjcNU4NhdQMm3CySdSKMfqvyTeuhNGiTYTkxQjzY4xOpwk18WrUc4F661euBIez+o1St3Y3ljpC9blX/VUkfkWLHUbOEu6xJrvIMdAXrntDxqucMq4vZvdD2StaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781248832; c=relaxed/simple;
	bh=IkWHCCFQX7aMDTxBgQKIawFEFZfCBBbHv2LydgIraqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0V+z6E3I82AjbRZKjK9vpIju555hwybl1l0vbzgaP+Q1mDg5afjOget8ItGpKPvaiSM+CSKbnUHrdwT1d6Flc82nT3QgzZot7xT4oQZfxCeXQXDvS3XYdWsbSt8JOI2YSqTk6lz8vSVnQBJYpw+FqsMfK8CIoMgug9jNPSRHao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ad1vzm1S; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ad1vzm1S"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7dc6fbf3e86so7901747b3.3
        for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 00:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781248830; cv=none;
        d=google.com; s=arc-20240605;
        b=Q7Xec5C6XepeRqnfjMQTo0ifOX3Mk7v7f7/nb1aqxIC3tZKVT35odPYhu+H1N1o7uy
         kvpLtvzGlLuPyekVb5JhqCsQTkb+6T0W8sJFhjA7EC1r42+UOIdcTC2xUlA46DG2WFJu
         WkWasZx7loQMtV7k9Wz7szGw8YqjZ2qh4+JcYyQq0rTQAxpufi7dvbap65NAYlnHH0jp
         WO/ISG7yYvr8r/gt6JuB/dpgwE947N8nEL/OEkbhe6hgs7OjdtoDwrFPAqilFMRq3/At
         8RoJ+dvwvGd8TUkFNxI/5liPBZ9Iyuzb1FoRA6WgwiufdP/XCcxle5IwOCNQtM1B2M+K
         5I7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        fh=1ec+ax6eAU4eKCkLWSP0i03WEI+vz/nBFMXsqcCVViE=;
        b=kSr9i/jyEoGcLvImucoo902433uzBvx0lu8WNs7QY39FrkLcihLA/oWbHcxi9UVk0C
         yC/9NMHnjWlbFg5ayzV28YrwNRky6UEHL0LfKvWTqKrMzfTj2tYV4BE7M2iyigAv5VKT
         GrH/hWmkdwAT5kOsjPI2NSsACAUTMihMEzo2c/a0RXbZ9yQxXPM+jvb1p0lGSRLMfLXz
         m06DwoTGZiEiwbc8/MXDJ+n4G9cEGTic7/LrFAtSH7JOn2rIKhlyoMOKH/pADCd8ceVk
         u5Hjr7+NOBn7eUU65K5kRj9Yh1lwunWdZsUyNx2gFyvF0zsAnXSXQOkL8GZe2E2E0F3C
         tqCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781248830; x=1781853630; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        b=ad1vzm1SEByahdM8p6cZtTic50j9nJzZH1F9MYJ1h0MS1MfFrQyo1aqa8mzj0E+B61
         CuSXIg+QZiI1ZTvHpyJnllX3OcmkNCnA+OMCWzUyY3GozmJ4wmgVW4tk16nYIiXENlW0
         eGRrHJFDmW3Q80CksDPvD1ng6x3Vhb01BWxHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781248830; x=1781853630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PEcj4bZjlu2HtgA6/DpQKuZoEr9jILxBgREI+9hl/bg=;
        b=U9vsJc64xqg5sc7jWCSSHqq/cSUSl4gtQHizhqZKabp3xyRTgmuemEqYIpVC78TJkp
         yME1OEvPRQK5ypp3QiCN5nzM2KCUJc8Mk5nh5YAAGK70NvDMMzWx+q/arHCekOGTYKvl
         2ycmA3uuSGKm/01ZQQtm3zL/2PKmrFri6jq+S/RgMtuageWO5iTpCP3YewDSUYwztaI3
         AFLVhYAvtW6KNjAAT/E557oOK9+w7wsCzGHyg8QngHWVIiRIOXObAZQBmws68okqwchM
         EUd+hoaxLFpVyCMw9/UCROVWY4NUOlNFli8ZtcAdFHjj1hHn2Oh0dkyvlyes07RdpBSC
         9Mnw==
X-Forwarded-Encrypted: i=1; AFNElJ9xi37A7kWLB7FSf/GShrAGAyUpLpyKMolr8k+81HQZ+VbqJG6pDQduyrbR1GwzbDh/pvE2dGCkeAga1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYZbWR22k6aJEwVhaum05ZQbIexAHUa6DrfA/aQ611RkOOssHl
	b8TAsuRzpWs/IzODieAaQLjz2lwBNxRSgXRLyudLSwGGqBnav5SjdCCd0MeagymMmCSqwYIg/9D
	dndE96xLdpG5rHgMqGYJ9oEYEbx5lIy3oxn75EZFL
X-Gm-Gg: Acq92OGo+VxeBu8H12Q4gATsa7+CxbSFBnX5LX84S1P1CCY7VlFQXAdoc2EMj5RCRIG
	aQXtQ5biG4V6gvc3xkcmg2Z/5GobYrKgH6j+70HNYs5HCc0z9By/3y3iIPiKV+O/OfkhGrPfvFr
	NjpzKxumTAgqUnUmL34m5MZabB1DHlRGujOes45uGOs1OMj6Ola1/UsFaliSETQIuoAykL5s6Ut
	50/l3C+RUyv10q0/tGmRy0RK2MaMSgOo8kpNAODLFE9YuIzbDKGfJfBE9cMzUKm9QU9tGdo1dMi
	IpLlhcO+
X-Received: by 2002:a05:690c:c4ce:b0:7ef:81dc:c0e7 with SMTP id
 00721157ae682-7f7b6242881mr15277067b3.19.1781248829675; Fri, 12 Jun 2026
 00:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-3-wenst@chromium.org>
 <ailv8HpnrCH3Zb8C@ashevche-desk.local>
In-Reply-To: <ailv8HpnrCH3Zb8C@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 16:20:18 +0900
X-Gm-Features: AVVi8Cfix6rlRxpmlL_G61si3smqjEz2qk3oIH1X9DTqc3HutmT3uL6lEMZg0_I
Message-ID: <CAGXv+5EHHWfiWgqPpf-RMKoSQLc2cd9OA4Z36SNoL5C53kVh2g@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 11:08=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:36PM +0800, Chen-Yu Tsai wrote:
> > Due to design constraints of the power sequencing API, the consumer
> > must first be sure that the other side is actually a provider, or it
> > will continually get -EPROBE_DEFER when requesting the power
> > sequencing descriptor.
> >
> > In the upcoming USB power sequencing integration, the USB hub driver
> > first needs to check whether a graph connection exists, and whether
> > the other side of the connection is a supported connector type. The
> > USB port is tied to a "port" firmware node, and this new helper will
> > be used to get the endpoint under the known "port" firmware node.
>
> ...
>
> > +/**
> > + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware no=
de in port
> > + * @port: Pointer to the target port firmware node
> > + * @prev: Previous endpoint node or %NULL to get the first
> > + *
> > + * The caller is responsible for calling fwnode_handle_put() on the re=
turned
> > + * fwnode pointer. Note that this function also puts a reference to @p=
rev
> > + * unconditionally.
> > + *
> > + * Return: an endpoint firmware node pointer or %NULL if no more endpo=
ints
> > + * are available.
>
> Yeah, you see, even here is inconsistency with previously added kernel-do=
c.
>
> > + */
> > +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct=
 fwnode_handle *port,
> > +                                                       struct fwnode_h=
andle *prev)
> > +{
> > +     struct fwnode_handle *ep;
>
> Unused?
>
> > +     while (1) {
>
> This is usually harder to read and follow. It's like "pay much attention =
on
> the code", but here no rocket science, no code to really pay attention to=
.
>
> > +             prev =3D fwnode_get_next_child_node(port, prev);
> > +             if (!prev)
> > +                     break;
> > +
> > +             if (WARN(!fwnode_name_eq(prev, "endpoint"),
> > +                      "non endpoint node is used (%pfw)", prev))
> > +                     continue;
> > +
> > +             break;
> > +     }
> > +
> > +     return prev;
> > +}
>
> So, this can be rewritten as
>
>         ep =3D prev;
>         do {
>                 ep =3D fwnode_get_next_child_node(port, ep);
>                 if (fwnode_name_eq(ep, "endpoint"))
>                         break;
>
>                 WARN_ON(ep, ...);
>         } while (ep);
>
>         return ep;
>
> But also big question why? to WARN*(). There is no use in the entire
> property.c.

Will drop. This function was lifted from drivers/of/property.c then
adapted to the fwnode APIs, so it still has the structure of its
origin. With the WARN() gone, rewriting it as do {} while() becomes:

do {
        prev =3D fwnode_get_next_child_node(port, prev);
        if (prev && fwnode_name_eq(prev, "endpoint"))
                break;
} while (prev);

return prev;


Thanks
ChenYu
