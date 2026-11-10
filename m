Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307951;
	b=TgFhjX+tkHOZTfYYYxN7RHYRbKB58ZVFD24QBysejaSfh8dsoC4TZDyBh6hAgjamiMCD
	 gmnLvO5qvBfxLrFgNUSjlkHoTQGhbXLxLZHjlUTZKDGCV4YTEj+a839YQk6sbJXstbx7M
	 7SUmZv0MfHXZVogeuAijxNOZuAPOTKvJmvFApoNNEOgUGO8+UAXcPNy4w70sQWp3FHXb6
	 pwW/B8Y6HX8y7twcHTPsyD3dw5fxpATlKaPJl0C3rSPN4Nm5P52VYpcNdEqyz3k8v3r9a
	 RMu9JmEQJL8zRkj+rWOTgftLRkz1V4CB9Q+hRlBdpMh1onA6RQBmNPEscGEXpcB+gdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
	b=rFdAnxq8Lv2I2NIRL1nUWbCCZHT5dPT0RizMIEzhjBaNa4etm3mwJIRn4gFfXNHA03BN
	 GHD/RcMAj0OhS0FdPkCVbhxFwwvmqMCeDQxZaQIG306LDzFpE8sctkfy7QG1TCr5AuGdJ
	 TfcflwcXuaQy2lVbREw1T4qVZi+fHtpilu8QWf5ZqzyCNohHqAFsyaeajRNPobR79w/IW
	 gVrX9hEnUyAVm3/ggAtUkK1NBjI/uh3pnae2fzSXBqYhvW4Zm9GjzFW6uCrAPC0+YKcIv
	 Y8Vf9x9FctN1ZRrwsobHc8rEGwJUCrBhQekPKHQdrNeAeyiFM+cQ6TWj0Chd8xLxH9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPXWC2Tt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE13606A330
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 10:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FE13606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPXWC2Tt
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b354d27917so15364547b3.0
        for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 02:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794307950; cv=none;
        d=google.com; s=arc-20260327;
        b=mVGCC/9lJKVopDwu3QUMxlNhjS9rhgJNgWSLcjVdqgBYXHqKx1QDBgXz+UX/UgsTRe
         vXf10NAZKl2hrpsv0Y7AkXZAG4JOLCcShxPhXLK+TfCJ7j7wqdky7wzD2bYfwiGsHbgj
         7j1iMOSddbAEH/DejBlY/sBe4pzfaX/8e/2scG54uPWPD26L7XDx1BvJH2AGsd2PmJDk
         5ysoRss26zLRrsvdwgvCLlbGuJF7aOIjsPlH05C2RcqWWQhb9d0ynBNeSfMWT3TFhyeE
         DJ5vXakgTRoMHsLS5O2kxP3sxnNFkqWEzF3PdmIOVFZMf4RzLnKqvGPxrLjOdsS860e3
         dOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        fh=WFaS8WPUSS/Gpd+aB1ICAq6Lo8NIincQbmLcPdWeC0o=;
        b=DxEqhvRzMpptMH/+VfumNOXyYRAqogTBnB6rkxppT0tV4i3QZy0bA+wrHMQCNHf5+9
         Rugy7gD4NCunRUUjIoHmRdCkomT8lMp1DErZtznPi2+P8lGpyAKuReFvr0fdOlVQc2PM
         0GccQ0bnbng4fkfoW35fgOuiJdgM6max/tEd2KiRbNvNli5tfPDa0pYkak8w7RYyc6L9
         Ei8fO3QTdTHJn25YG4kmVD86Ip+5URUOHuqAU2aiAL9H0KzPXuA9boDwXbIy2fYGJiL4
         iAoKwu53vLvpIcT/eIIM87h0W7CiWMVyZz0tOU+3EzsbrPjAZ3E3FJPCqVwSNQty851j
         EP/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794307950; x=1794912750; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        b=KPXWC2TthQhDe8XAXGrzcXb78rq3PnnDkK5pfcngTpgy/Bm8VvVOifE79bNhXuLW35
         pkZzfctMTkkAMDndKNBQO1aURn+Yfl+Nc9Ba7kBHI6I2xyNNodHdMadRFCVc0OQR8vuT
         YvVQw3EuEiy6EHHOlMtNfiA58vzvrCAkvpXO1PvUqJ2KaPjqIesMzf4oiISBbuoeLR4e
         B3zcU/DW/j/wnhUxXprwNYgdfQwKp1d0zvoas0Cbajk+S29//wnPt9NZlWjW6db51K9Q
         6BSRMCaoZmGzAt3edbQUnAE8MciINdpu+jrru+hpLKKsGDbvAJw4UwxPzCFVAhMxWpu8
         wXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307950; x=1794912750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz1/GqxJfr5fovZK3WCpsTphS4Ees9ZlA9FefTtrxKA=;
        b=dFmNm9j7nd/sn75ecHJK6+KII+6aOj//NyLL6XdYbSWK2Z7389aewKELlUIzC6pyd1
         ioBJEMY7hp8wfRVfEPymGRkS4tXnsRVsgAaJ66msObCXAWrXjw4rqMdpZvwDnk+s2Mcr
         T7jRul85nRmzWgx2paW+oW12qr2lyzX+W3AOB6IDQcw7hwGuVssCeRH7j1QZJp2yevdP
         Z+AOffM2l5RZnDfqc//YVolxswYJg+qSxw0oc5pwpR21hCTY26XQODk661wEu5Lx3bQ7
         +ZqxCOxL6xIZ4wr6M2Xk9aa5TCYCZYJuZXdTABeo+GDV63gEh0hiDpIgyzHqJkNKGAkz
         Co7A==
X-Forwarded-Encrypted: i=1; AL+hErEoLfr6CQTeuajvgjJ6Bjpp8jU8PgxxmbB5VVwxPya4A0SQDX9wznRELogv45C+WbJGzHkcqyUMNQwEBw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZxrMbHSwCOfprmHA1q/Iz8rHGtAmjD67Ws3xsh/EFbY4nJQMk
	x96+c19aA6ZatRyuy2kc6hBtFgrv6VLRJLOVu1M2Qoe7jD4umdbZgkPV9EOhajuM46GVECABI7b
	8qY51VkFqU4pemwXJTkE1WRNpLlhg+4Y=
X-Gm-Gg: AYBFou2ZWqqnPsgBxUIODtsfdhzZATgkdORqCewKJglSZ5FfEZwiucIlnicsiLYN/Qr
	b6UrI2rmqDJHoCCzs9OVMh0KUYZLgIBtOhXPR2jNvHwyRme0Abs08i+TkI/MG8MI/1LwjiN9O/B
	/hkfD1KBVlpaZghnUdwV0dnmN2VkrStjXfh+4ydhYxHjbqvmNV8gKe25SzIbaYbZ8Ouo53tPz5x
	7EeAY7Ktz4XpviB3KycL0W2faG5qtP2OfrI5KJb5nX8Gi6vHQEGVWDlTrnlQJuapixIzyIPrBBz
	NVG6qNxnl+1B03WFGlmpZr8y0OxQEYgNPuJJs1gvu/Ft4ajZN18zFSuRcabqrmH0sgBnz0jK64T
	P2z/fkW6LHjACICvGN4vEZzINLP+kfVmO+XC4w55hnIiZ1BREwTDw2UEI4LRMPOVuE3sAwccsGc
	qAwkwVCABNstJiVTRlHl7VPWB1cuXo6h/81+auxoTAMVgHjUBKJVh9ZUgrNMQLIirzF1SNMJiw2
	bV6cf3WMW0w5wOnpDw7eZwdOqEJ7gjGvCjl9AgkimGNNpw7unoZTpUS0hS3NA==
X-Received: by 2002:a05:690c:4804:b0:8b3:4022:d81b with SMTP id
 00721157ae682-8b39281e93amr14763687b3.4.1794307950215; Tue, 10 Nov 2026
 02:52:30 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
 <20261104-fwnode-for-each-prop-v1-5-6e28fe1c72c4@oss.qualcomm.com>
 <auuhy40x1BMoW96-@ashevche-desk.local> <7sfr4ljlwbehal3or4dmy5jxbjz6ya2lf3dq3yptr54wym5tea@eqaexflmocih>
 <avICwdxyi-W1Y3PD@ashevche-desk.local> <ab73ez55exen3ew52svsxfinwsuatppdodu2e2zp6izjwwqwwu@2imxzxwclgtl>
 <CAHp75VcwiGHB73ny8iSvXeFdjbTKUpnXZPS5iD7NwaMcJ6q-7A@mail.gmail.com> <l7ppjeoqvc6hblk52a6upei4ee2caahe2ltiur4gwig3ez7d3c@dmzzy22ixvlc>
In-Reply-To: <l7ppjeoqvc6hblk52a6upei4ee2caahe2ltiur4gwig3ez7d3c@dmzzy22ixvlc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 12:51:53 +0200
X-Gm-Features: AclHuK_OONOCVTyFsjjRyXe2igkmpzvumbiGAvSGjLyAIyl_gOSbE4gZk1U_Cc4
Message-ID: <CAHp75VdZpqt8PzVypQ85U1OjxszXOmCP9MKv3ozQOh-UVFnR-w@mail.gmail.com>
Subject: Re: [PATCH 5/9] of: property: implement the .property_get_names()
 fwnode operation
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:50=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
> On Tue, Nov 10, 2026 at 11:12:02AM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 10, 2026 at 11:00=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> > > On Mon, Nov 09, 2026 at 07:28:33PM +0200, Andy Shevchenko wrote:
> > > > On Mon, Nov 09, 2026 at 02:07:46PM +0100, Bartosz Golaszewski wrote=
:
> > > > > On Wed, Nov 04, 2026 at 11:21:15PM +0200, Andy Shevchenko wrote:
> > > > > > On Wed, Nov 04, 2026 at 03:03:47PM +0100, Bartosz Golaszewski w=
rote:

...

> > > PS: is there a way of using match_string() with non-const data?
> >
> > Why? It's an input parameter, it returns an index. Whatever you
> > provide will be not modified.


> What I mean is that the following change

> +               ret =3D match_string(merged, n1, sec_props.array[i]);
> +               if (ret >=3D n1) {
>                         merged[count++] =3D sec_props.array[i];
>                         sec_props.array[i] =3D NULL;
>                 }
>
> Results in:

> drivers/base/property.c: In function =E2=80=98fwnode_property_get_names=
=E2=80=99:
> drivers/base/property.c:607:36: error: passing argument 1 of =E2=80=98mat=
ch_string=E2=80=99 from incompatible pointer type [-Wincompatible-pointer-t=
ypes]

> And I don't see a good way of working around it without doing:
>
>         match_string((const char *const)merged, n1, sec_props.array[i]));
>
> which is ugly.

Ah, got it! But why is the "merges" char ** and not char * const *? I
believe that will fix the issue.

--=20
With Best Regards,
Andy Shevchenko
