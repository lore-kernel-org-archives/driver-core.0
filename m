Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E2E1A8F84
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 08:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277768; cv=none; b=OwJYjAfOCWL2A86hspfYXpxst15g+ey8sDfHj+rLvWHNryNV59wqKTelsMi3oE/JBIPcFKuINrSlq7HuJR7g7Wj9EP3JXejHuBSEZF2beBgUz1ZyMpYiPF3PmLSr9FPZT6XXRB3NiWYTR1W7Q72FcF+SN0lHVuebouwZB9tepsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277768; c=relaxed/simple;
	bh=6D6WI9h/HgOWdKUs0QWHirK2fOBqO/lvTMizpPavzhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m06Tt+6A0L/9azDmPpeT47D7EcLH+MoLx7gZFu8Beob/RzM5shDIL3PmikqCWVq4n6r8f4Nfvq5i1eM2GD0C8rWL7jCWtdXfn0BD91mXMu7Wt9mhsJYk3i3rB8s1l2lPg4LyF47W7x1DVgJA7omR5xyBTnqddJ9A6SPX7IJhqdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQ+LjWUr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQ+LjWUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2CECC19425
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 08:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777277767;
	bh=6D6WI9h/HgOWdKUs0QWHirK2fOBqO/lvTMizpPavzhQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dQ+LjWUrX7xm7J8IbCZ6g/BQHaYW+cWL5fMDLYpv9j2JE42awoxGMAHGleaOmK5er
	 /l5UKVvDp9j/VRN6kKsqJXE2xQdV2IGQs/hNQBgK+L2vbIX6jGDFhkb421y1WZwLkD
	 RxBKvR0w1Z4Rz2S/tnrjefvl+zZrzLxmEn0Pm7LjAAJo2SwiktzOcvCP1POKywrDul
	 p4r1S+qMTKhNGQVFjidFBkRKzJI8u/gk+G8pVZwaGFZmfJm6o60SDuqBcwDz95DAJD
	 KHftPDHuVrylsteQodhIK4/QvDDobo67FKvkQJFRq5brQHQzNdmvnKkMPVerlZj0eR
	 xFXz8KM+/twQQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso654569e87.1
        for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 01:16:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/5lRr9Dk4BZwEQgYqIa/oARAhgGTrDMVdOvp1RcnsNC+T7usKH1GsS2LZlNwrquxykQhTAcmEMP3SSsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwH+/5FC3o3NhbQStcbvGQAjG19enGa/jrxh070Zh2ibxTy1hJ4
	+q5cdt/xMNTF9h7n9PJKuBcH7AskkhVhCzBa8LmPhS92n1NKZp8EecyTS5YPQzM7fz8UwBFEONo
	QDbzxuRdwUhPOB0XUVT8il1K8L4KGzbPCSB8co7Aykw==
X-Received: by 2002:a05:6512:159f:b0:5a3:f0f7:7da1 with SMTP id
 2adb3069b0e04-5a4172cd17amr15273699e87.17.1777277766544; Mon, 27 Apr 2026
 01:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424124250.92890-1-bartosz.golaszewski@oss.qualcomm.com>
 <aetxEcjE8wD4-ZyV@ashevche-desk.local> <CAMRc=Mem3m8JZXafL9xrUvWZWuFaCofkNEdVYLNMgC+3N0i21g@mail.gmail.com>
 <aeuNEYymSicUcMyZ@ashevche-desk.local>
In-Reply-To: <aeuNEYymSicUcMyZ@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 10:15:54 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mc-Tk7fqZT=JinL8+01YdTGJq-LciZgnnGkaNEXa8Db_Q@mail.gmail.com>
X-Gm-Features: AVHnY4I6orj-67xKvyAVoxUvX0YJCp_u041CAHSIKuRD6hL_Ikhw7dI4X2Dj1oY
Message-ID: <CAMRc=Mc-Tk7fqZT=JinL8+01YdTGJq-LciZgnnGkaNEXa8Db_Q@mail.gmail.com>
Subject: Re: [PATCH] software node: provide wrappers around kobject_get/put()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 5:32=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> should also work. And here I referred to the fact that we already have a =
kobject
> instance available. Yes, my counter example is just to reveal inconsisten=
cy,
> I kinda agree that using swnode specific API might be clearer approach.
>

Let's do kobject_name() -> swnode_name() separately?

Bart
