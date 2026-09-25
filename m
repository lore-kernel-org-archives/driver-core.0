Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B269D4D37CC
	for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350404; cv=none; b=lLi3I0Ej0j6baZ6+YOG+LIojp4QPr7rQsM10nJoSonCKGdSAqMs/1r2ZCKGxNeE58lvuQKKlsCPqxhXvqvvnvSbF+eyGPS0CHmXGJJYW/9E0X796ctKdGsOhclZ5bnoezqIF24IxT2fHtO2C49sl+wy+0oT1EkNaXp1B43tZlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350404; c=relaxed/simple;
	bh=jbNVAk+OkDb7djIuHrzYgHW689hWDBX8CwCo7YvnX/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0t+ebEy6+eze8+vNkivjEcVfKpD/5KZ2GZ9m7RX3YpGOw8799hoAjtvpvC85V7t70dmY1rP1ArBaf9xSxGAECJe/XT9BjL30xkE+fo7ah3PequGQPQwkv8OecNZYdigtgifxLyCH8A7nkWpJnaSIA5B6jBnLH4cfeu6h+RU47g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJEOptSo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJEOptSo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEDC1F00898
	for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790350402;
	bh=46Ao4VjYR8dIxW1+9XEQXLH/O/o/q50obgWXmJ78FCM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QJEOptSoTA53O7Vlu0uIrHHjF0vHyi+PX3kGmaQv0Q7SfbS5tJ9xauoPuV7+fVvkg
	 cAlP9MFfbCZxUxj+PggCqKIRQPcdOSgGWfG3s42R9xp4QJjaGJq1mtPC3r9VXc741k
	 O3Pu9HvSmkiFueUO+wHFXRLg0QBclbmb67iWeWuGQhrUHy5k72d+POaqMJvQK3rX7Q
	 /1X1dyyELzx4Y6pRPLM0FOJizBQiUuvqobhqlSwp3UKR5dbKyFzYPiu382ZI0k3dGN
	 cUGMbKA5z6EtonXI+qJAyl2BEPbqKLOudqj/ciDxMuI4xTGEJg2go2Lw9c6FRhFmn/
	 bDb1VV/q7t10A==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5d0ad9b89so8435981fa.2
        for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 08:33:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwr6x33mA5dj+mL5CmYqysCb48Z8Nw4tGBZ2MSz7/dfutN+5dljP1LCcOOI4PYcA5GpgTa0gT/f0m2rrw==@lists.linux.dev
X-Gm-Message-State: AFuF++mfrMhUNbgz6vBxcJn9DDDHfX7KXnC2au7UO4VSQnlK1tCnhxEV
	Yz5wNqNEzKBPUj6bj+tV3ypI+OvQnOc9ZHpzBmLkgZsdqM1javBFWAuAG0mHuftnYeCq0kjfzmN
	BuJ/wKYla+7vH2T29MqUYVMpTK+HYKjM=
X-Received: by 2002:a2e:be11:0:b0:3a3:2ff2:f818 with SMTP id
 38308e7fff4ca-3a63c30cc59mr17816311fa.13.1790350400829; Fri, 25 Sep 2026
 08:33:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12985239.O9o76ZdvQC@rafael.j.wysocki> <DLOD6E6L35CN.KDDA9DEG9WP0@kernel.org>
In-Reply-To: <DLOD6E6L35CN.KDDA9DEG9WP0@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 25 Sep 2026 17:31:43 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iVCs8qtfHcT9ZMEVSzjPVQqaLPpP3HXuFVWUy72nPwXQ@mail.gmail.com>
X-Gm-Features: AclHuK_BTeX0TEHJmDgkOdFgecHf8SrpoMQgEO6UlwU0dLvUHLE7J3ttsfhnS-o
Message-ID: <CAJZ5v0iVCs8qtfHcT9ZMEVSzjPVQqaLPpP3HXuFVWUy72nPwXQ@mail.gmail.com>
Subject: Re: [PATCH v3] driver core/ACPI: Introduce companion_bus_register()
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Linux Driver Core Development <driver-core@lists.linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Michael Kelley <mhklinux@outlook.com>, 
	Hyper-V List <linux-hyperv@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 1:34=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri Sep 25, 2026 at 11:23 AM CEST, Rafael J. Wysocki wrote:
> > From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > The ACPI bus type does not allow drivers to be matched to devices, so
> > the sysfs attributes related to drivers created for it are useless and
> > their existence is confusing.
> >
> > Moreover, it is better to prevent drivers from being registered and
> > looked up for a bus like that.
> >
> > To allow skipping the creation of those sysfs attributes and preventing
> > driver registration and lookup for the ACPI bus type, introduce a
> > "companion" bus type concept and add a special registration function
> > for registering "companion" bus types, companion_bus_register().
> >
> > The "drivers" directory under the ACPI bus type is still needed because
> > there are versions of systemd that depend on it [1].
>
> Maybe we should also add a brief note above kset_create_and_add("drivers"=
, ...)
> why we retain the directory even if !use_drivers.

Yeah, won't hurt.  I'll add one, or somebody will try to "fix" it in the fu=
ture.

> > Link: https://lore.kernel.org/linux-acpi/SN6PR02MB41575266A4580339E186E=
5D9D4812@SN6PR02MB4157.namprd02.prod.outlook.com/ [1]
> > Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>

Thanks!
